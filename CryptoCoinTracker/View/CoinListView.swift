//
//  ContentView.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 3/4/25.
//


import SwiftUI

struct CoinListView: View {
    
    @State private var viewModel: CoinListViewModel
    @State private var isShowingAlert = false
    
    init(viewModel: CoinListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.coins) { coin in
                    AsyncImage(url: URL(string: coin.image ?? "" )) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .frame(width: 30, height: 30)
                        } else if phase.error != nil {
                            Text("Rip")
                        } else {
                           ProgressView()
                        }
                    }
                    HStack {
                        VStack {
                            Text(coin.name)
                                .font(.headline)
                        }
                    }
                }
            }
            .onAppear {
                Task {
                    try await viewModel.fetchCoins()
                }
            }
            .alert("error", isPresented: $isShowingAlert, actions: {
                Text("something Went Wrong")
            })
            .navigationTitle("Coins")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CoinListView(viewModel: CoinListViewModel(coinRepository: Repository(dataService: DataService())))
}

