//
//  NetworkLayer.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 3/4/25.
//

//
//import Foundation
//
//enum HTTPMethod: String {
//    case GET = "GET"
//    case POST = "POST"
//    case PUT = "PUT"
//    case DELETE = "DELETE"
//}
//
//enum Endpoints {
//    case endpoint1(CoinModel)
//    case endpoint2
//    
//    var patch: String {
//        switch self {
//        case .endpoint1: return "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"
//        case .endpoint2: return "error"
//            
//        }
//    }
//    
//    var httpMethod: HTTPMethod {
//        switch self {
//        case .endpoint1: return .GET
//        case .endpoint2: return .GET
//        }
//    }
//    
//    
//    var data: Data? {
//        switch self {
//        case .endpoint1(let CoinModel):
//            do {
//                return try JSONEncoder().encode(CoinModel)
//            } catch {
//                print(error.localizedDescription)
//                return nil
//            }
//        case .endpoint2:
//            return nil
//        }
//    }
//}


/*
 
 func fetchCoins() async throws -> [CoinModel] {
     let url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"
     guard let urlString = URL(string: url) else {
         throw URLError(.badURL)
     }
     let (data,response) = try await URLSession.shared.data(from: urlString)
     try httpResponse(response: response)
     let decoder = JSONDecoder()
     let coinsData = try decoder.decode([CoinModel].self, from: data)
     print(coinsData.count)
     return coinsData
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
 
 
 func fetchData2<T: Decodable>(from request: URLRequest) async throws -> T {
     let (data, response) = try await URLSession.shared.data(for: request)
     
     try httpResponse(response: response)
     decoder.keyDecodingStrategy = .convertFromSnakeCase
     
     return try decoder.decode(T.self, from: data)
 }

 
 */


/*
 func callEndpoint1(model: CoinModel) async throws -> CoinModel? {
 guard let request = DataService.returnEndpoint(endpoint: .endpoint1(model)) else { return nil }
 return try await dataService.fetchData2(from: request)
 }
 */

/*
 
 curl --request GET \
 --url 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=bitcoin&category=layer-1&order=market_cap_desc&per_page=200&page=1&sparkline=true&price_change_percentage=1h' \
 --header 'accept: application/json' \
 --header 'x-cg-demo-api-key: CG-yZWjZiaxGxLGNg5xzvWFGteY    '
 */

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)


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
