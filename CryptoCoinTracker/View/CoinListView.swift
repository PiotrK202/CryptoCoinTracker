//
//  ContentView.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 3/4/25.
//


import SwiftUI

struct CoinListView: View {
    
    @State private var viewModel: CoinListViewModel
    @State private var isLoggedIn = false
    @State private var showProfile = false
    @State private var showLogin = false
    @State private var searchForCoins = ""
    
    private var filtredCoins: [CoinModel] {
        if searchForCoins.isEmpty {
            return viewModel.coins
        } else {
            return viewModel.coins.filter { coin in
                coin.name.localizedStandardContains(searchForCoins)
            }
        }
    }
    
    init(viewModel: CoinListViewModel) {
        _viewModel = State(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            List {
                ForEach(filtredCoins) { coin in
                    Button {
                        viewModel.path.append(NavigationRoute.coinDetail(coin))
                    } label: {
                        HStack(spacing:20) {
                            AsyncImage(url: URL(string: coin.image ?? "" )) { phase in
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                } else if phase.error != nil {
                                    ImageDownloadErrorView()
                                } else {
                                    ProgressView()
                                }
                            }
                            
                            Text(coin.name)
                                .font(.headline)
                            ZStack {
                                Color.gray.opacity(0.001)
                                Spacer()
                            }
                            Text("\(coin.formattedPrice) $")
                                .font(.subheadline)
                            
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .searchable(text: $searchForCoins, prompt: "search coin")
            .onAppear {
                Task {
                    try await viewModel.fetchCoin()
                    isLoggedIn = viewModel.isUserLoggedIn()
                }
            }
            .navigationTitle("Coins")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(isLoggedIn ? "Profile" : "Login") {
                        viewModel.path.append(isLoggedIn ? .profile : .login)
                    }
                }
            }
            .navigationDestination(for:NavigationRoute.self) { route in
                switch route {
                case .login:
                    LoginView(isLoggedIn: $isLoggedIn)
                case .profile:
                    ProfileView()
                case .coinDetail(let coin):
                    CoinDetialView(viewModel: CoinDetailViewModel(coin: coin))
                }
            }
        }
    }
}

#Preview {
    CoinListView(viewModel: CoinListViewModel(coinRepository: Repository(dataService: DataService())))
}

