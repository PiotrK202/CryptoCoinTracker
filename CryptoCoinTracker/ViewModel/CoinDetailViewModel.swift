//
//  CoinDetailViewModel.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 3/4/25.
//

import Foundation

@Observable
final class CoinDetailViewModel {
    var coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
    }
}
