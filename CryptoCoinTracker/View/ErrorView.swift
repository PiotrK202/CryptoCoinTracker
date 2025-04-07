//
//  ErrorView.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 4/4/25.
//

import SwiftUI

struct ErrorView: View {
    @State private var viewModel: CoinListViewModel
    
    init(viewModel: CoinListViewModel) {
        _viewModel = State(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Something Went Wrong")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(width: 300, height: 300)
                .background(RoundedRectangle(cornerRadius: 25))
                .padding()
            
            Spacer()
            
            Button("try download again") {
                Task {
                    try await viewModel.fetchCoin()
                }
            }
            .font(.headline)
            .foregroundStyle(.white)
            .frame(width: 300, height: 50)
            .background(RoundedRectangle(cornerRadius: 25))
            
            Spacer()
        }
    }
}

#Preview {
    ErrorView(viewModel: CoinListViewModel(coinRepository: Repository(dataService: DataService())))
}
