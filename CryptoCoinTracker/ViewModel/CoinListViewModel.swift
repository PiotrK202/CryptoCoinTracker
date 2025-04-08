//
//  CoinListViewModel.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 3/4/25.
//

import Foundation
import SwiftUI

enum NavigationRoute: Hashable {
    case login
    case profile
    case coinDetail(CoinModel)
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
}

/*
 func fetchCoins() async throws {
     do {
         coins = try await coinRepository.fetchCoins()
         print(coins.count)
     } catch {
         print(error.localizedDescription)
     }
 }
 
 
 //    func image(for coin: CoinModel) -> URL? {
 //        let image = coin.image ?? ""
 //        guard let url = URL(string: image) else { return nil }
 //        return url
 //    }
 //
 */
