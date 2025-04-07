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
    
    init(viewModel: CoinListViewModel) {
        _viewModel = State(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            List {
                ForEach(viewModel.coins) { coin in
                    VStack {
                        HStack(spacing:20) {
                            Button {
                                viewModel.path.append(NvaigationRoute.coinDetail(coin))
                                
                            } label: {
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
                                Spacer()
                                
                                Text("\(coin.formattedPrice) $")
                                    .font(.subheadline)
                                
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
            .onAppear {
                Task {
                    try await viewModel.fetchCoin()
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
            .navigationDestination(for:NvaigationRoute.self) { route in
                switch route {
                case .login:
                    LoginView()
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

