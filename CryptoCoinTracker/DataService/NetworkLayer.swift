//
//  NetworkLayer.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 3/4/25.
//


import Foundation

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

enum Endpoints {
    case endpoint1(CoinModel)
    case endpoint2
    
    var patch: String {
        switch self {
        case .endpoint1: return "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=bitcoin&order=market_cap_desc&per_page=100&page=1&sparkline=false"
        case .endpoint2: return "error"
            
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .endpoint1: return .GET
        case .endpoint2: return .GET
        }
    }
    
    
    var data: Data? {
        switch self {
        case .endpoint1(let CoinModel):
            do {
                return try JSONEncoder().encode(CoinModel)
            } catch {
                print(error.localizedDescription)
                return nil
            }
        case .endpoint2:
            return nil
        }
    }
}

