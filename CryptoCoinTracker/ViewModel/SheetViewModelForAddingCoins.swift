//
//  SheetViewModelForAddingCoins.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 8/4/25.
//

import Foundation

@Observable
final class SheetViewModelForAddingCoinsc {
    private let coinRepository: RepositoriesProtocol
    var coins = [CoinModel]()
    
    init(coinRepository: RepositoriesProtocol) {
        self.coinRepository = coinRepository
    }
    
    func fetchCoin() async throws {
        do {
            let fetchedCoins: [CoinModel] = try await coinRepository.fetchCoins()
            self.coins = fetchedCoins
        } catch {
            print(error.localizedDescription)
        }
    }
}
