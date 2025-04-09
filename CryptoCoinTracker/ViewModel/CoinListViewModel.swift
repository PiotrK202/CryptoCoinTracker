//
//  CoinListViewModel.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 3/4/25.
//

import Foundation
import SwiftUI

enum NavigationRoute: Hashable {
    case signUp
    case profile
    case coinDetail(CoinModel)
    case login
}

@Observable
final class CoinListViewModel {
    private let coinRepository: RepositoriesProtocol
    var coins = [CoinModel]()
    var path: [NavigationRoute] = []
    
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
    func isUserLoggedIn() -> Bool {
        SessionHelper.isLoggedIn
    }
}
