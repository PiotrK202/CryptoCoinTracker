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
    private let sessionHelper: SessionHelperProtocole
    var coins = [CoinModel]()
    var path: [NavigationRoute] = []
    
    init(coinRepository: RepositoriesProtocol, sessionHelper: SessionHelperProtocole) {
        self.coinRepository = coinRepository
        self.sessionHelper = sessionHelper
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
        sessionHelper.isLoggedIn
    }
}
