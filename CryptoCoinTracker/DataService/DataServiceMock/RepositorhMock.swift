//
//  RepositorhMock.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 7/4/25.
//

import Foundation

struct RepositoryMock: RepositoriesProtocol {
    func fetchCoins() async throws -> [CoinModel] {
        return [
            CoinModel(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png", currentPrice: 50000.0, marketCap: nil, marketCapRank: nil, fullyDilutedValuation: nil, totalVolume: nil, high24H: nil, low24H: nil, priceChange24H: nil, priceChangePercentage24H: nil, marketCapChange24H: nil, marketCapChangePercentage24H: nil, circulatingSupply: nil, totalSupply: nil, maxSupply: nil, ath: nil, athChangePercentage: nil, athDate: nil, atl: nil, atlChangePercentage: nil, atlDate: nil, lastUpdated: nil, sparklineIn7D: nil, priceChangePercentage1HInCurrency: nil)
        ]
    }
}

struct RepositoryMockFail: RepositoriesProtocol {
    func fetchCoins() async throws -> [CoinModel] {
        throw URLError(.badURL)
    }
}
