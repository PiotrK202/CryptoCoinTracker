//
//  Repositories.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 3/4/25.
//

import Foundation

struct Repository {
    
    private let dataService: DataService
    
    
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    func fetchCoins() async throws -> [CoinModel] {
        let url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"
        return try await dataService.fetchData(from: url)
    }
    
    func fetchCoins2() async throws -> [CoinModel] {
        return try await  dataService.fetchCoins()
    }
}

/*
 func callEndpoint1(model: CoinModel) async throws -> CoinModel? {
     guard let request = DataService.returnEndpoint(endpoint: .endpoint1(model)) else { return nil }
     return try await dataService.fetchData2(from: request)
 }
 */
