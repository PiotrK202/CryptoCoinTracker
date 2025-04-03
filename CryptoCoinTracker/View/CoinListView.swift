//
//  ContentView.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 3/4/25.
//


import SwiftUI

struct CoinListView: View {
    
    @State private var viewModel: CoinListViewModel
    
    init(viewModel: CoinListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.coins) { coin in
                    NavigationLink(destination: Text("hello")) {
                        Text(coin.name)
                    }
                }
            }
            .onAppear {
                Task {
                    try await viewModel.fetchCoin()
                }
            }
            .navigationTitle("Coins")
        }
    }
}

#Preview {
    CoinListView(viewModel: CoinListViewModel(coinRepository: Repository(dataService: DataService())))
}
