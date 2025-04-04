//
//  CoinDetialView.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 3/4/25.
//

import SwiftUI

struct CoinDetialView: View {
    @State var viewModel: CoinDetailViewModel
    var body: some View {
        VStack {
            Text("ho")
        }
    }
}

#Preview {
    CoinDetialView(viewModel: CoinDetailViewModel(coin: CoinModel.example))
}
