//
//  CoinDataService.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 3/4/25.
//

import Foundation

struct DataService {
    let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=bitcoin&order=market_cap_desc&per_page=100&page=1&sparkline=false")!

    private let decoder = JSONDecoder()
    
    func fetchData2<T: Decodable>(from request: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: request)
        
        try httpResponse(response: response)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try decoder.decode(T.self, from: data)
    }
   
    func fetchData<T: Decodable>(from urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        
        let (data, response) = try await URLSession.shared.data(from: url)
        try httpResponse(response: response)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try decoder.decode(T.self, from: data)
    }
    
    static func returnEndpoint(endpoint: Endpoints) -> URLRequest? {
        guard let url = URL(string: endpoint.patch) else {
            return nil
        }
        var request = URLRequest(url:url, timeoutInterval: 10)
        request.httpMethod = endpoint.httpMethod.rawValue
        request.httpBody = endpoint.data
        
        return request
    }
    
    private func httpResponse(response: URLResponse ) throws {
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
    }
}


