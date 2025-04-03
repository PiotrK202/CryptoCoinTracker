//
//  CoinListViewModel.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 3/4/25.
//

import Foundation

@Observable
class CoinListViewModel {
    private let coinRepository: Repository
    var coins = [CoinModel]()
    
    init(coinRepository: Repository) {
        self.coinRepository = coinRepository
    }
    
    @MainActor
    func fetchCoin() async throws {
        do {
            let fetchedCoins: [CoinModel] = try await coinRepository.fetchCoins()
            self.coins = fetchedCoins
        } catch {
            print(error.localizedDescription)
        }
    }
}

