//
//  CoinDataService.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 3/4/25.
//

import Foundation

protocol DataServiceProtocol {
    func fetchData<T: Decodable>(from urlString: String) async throws -> T
}

struct DataService: DataServiceProtocol {
    
    func fetchData<T: Decodable>(from urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            try httpResponse(response: response)
            let decoder = JSONDecoder()
            
            return try decoder.decode(T.self, from: data)
        } catch {
            throw error
        }
    }
    
    private func httpResponse(response: URLResponse ) throws {
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
    }
}


