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
        NavigationStack {
            List {
                ForEach(viewModel.coins) { coin in
                    VStack {
                        HStack(spacing:20) {
                            NavigationLink(destination: CoinDetialView(viewModel: CoinDetailViewModel(coin: coin))) {
                                AsyncImage(url: URL(string: coin.image ?? "" )) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                    } else if phase.error != nil {
                                        ErrorView(viewModel: viewModel)
                                    } else {
                                        ProgressView()
                                    }
                                }
                                VStack {
                                    Text(coin.name)
                                        .font(.headline)
                                    
                                    Text("\(coin.currentPrice) $")
                                }
                            }
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
                    VStack {
                        Button(isLoggedIn ? "Profile" : "Login") {
                            if isLoggedIn {
                                showProfile = true
                            } else {
                                showLogin = true
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CoinListView(viewModel: CoinListViewModel(coinRepository: Repository(dataService: DataService())))
}

