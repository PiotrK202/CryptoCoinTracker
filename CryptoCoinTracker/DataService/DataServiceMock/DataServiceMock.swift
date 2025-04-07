//
//  DataServiceMock.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 4/4/25.
//

import Foundation

struct DataServiceMock: DataServiceProtocol {
    func fetchData<T: Decodable>(from urlString: String) async throws -> T {
        if let data = """
        [
            {
                "id": "bitcoin",
                "symbol": "btc",
                "name": "Bitcoin",
                "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png",
                "current_price": 50000.0
            }
        ]
        """.data(using: .utf8) {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        }
        throw URLError(.badServerResponse)
    }
}

struct DataServiceMockFail: DataServiceProtocol {
    func fetchData<T>(from urlString: String) async throws -> T where T : Decodable {
        throw URLError(.badServerResponse)
    }
}
