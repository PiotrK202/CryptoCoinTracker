//
//  SheetViewForAddingCoin.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 8/4/25.
//

import SwiftUI

struct SheetViewForAddingCoin: View {
    @Environment(\.dismiss) private var dismiss
    @State private var viewModel: SheetViewModelForAddingCoinsc
    let onSelect: (CoinModel) -> Void
    
    init(viewModel: SheetViewModelForAddingCoinsc, onSelect: @escaping (CoinModel) -> Void) {
        _viewModel = State(wrappedValue: viewModel)
        self.onSelect = onSelect
    }
    var body: some View {
        List {
            ForEach(viewModel.coins) { coin in
                Text(coin.name)
                    .onTapGesture {
                        onSelect(coin)
                        dismiss()
                    }
            }
            
        }
        .onAppear {
            Task {
                try await viewModel.fetchCoin()
            }
        }
    }
}

