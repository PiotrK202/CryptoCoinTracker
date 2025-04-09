//
//  SheetViewModelForAddingCoins.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 8/4/25.
//


// zapytac sie czy lepiej jest tak czy lepiej by bylo dac temu sheet view coinlistVM

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
