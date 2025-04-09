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
    @State private var showAlert = false
    
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
//            .alert("You are alredy Loged In" ,isPresented: $showAlert) {
//                Button("Ok",role: .cancel) { }
//            }
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
                    Button(isLoggedIn ? "Profile" : "SignUp") {
                        viewModel.path.append(isLoggedIn ? .profile : .signUp)
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(isLoggedIn ? "" : "Login") {
                        viewModel.path.append(.login)
                    }
                }
            }
            .navigationDestination(for:NavigationRoute.self) { route in
                switch route {
                case .signUp:
                    SignUpView(isLoggedIn: $isLoggedIn)
                case .profile:
                    ProfileView(isLoggedIn: $isLoggedIn)
                case .coinDetail(let coin):
                    CoinDetialView(viewModel: CoinDetailViewModel(coin: coin))
                case .login:
                    LoginView(isLoggedIn: $isLoggedIn)
                }
            }
        }
    }
}

#Preview {
    CoinListView(viewModel: CoinListViewModel(coinRepository: Repository(dataService: DataService())))
}

