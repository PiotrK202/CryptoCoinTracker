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
    
    init(viewModel: SheetViewModelForAddingCoinsc) {
        _viewModel = State(wrappedValue: viewModel)
    }
    var body: some View {
        List {
            ForEach(viewModel.coins) { coin in
                Text(coin.name)
                    .onTapGesture {
                        
                }
            }
        }
    }
}

#Preview {
    SheetViewForAddingCoin(viewModel: SheetViewModelForAddingCoinsc(coinRepository: Repository(dataService: DataService())))
}
