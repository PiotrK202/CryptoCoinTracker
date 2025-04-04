//
//  CoinModel.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 3/4/25.
//

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

import Foundation

struct CoinModel: Codable, Identifiable {
    let id, symbol, name: String
    let image: String?
    let currentPrice: Double?
    let marketCap: Double?
    let marketCapRank: Int?
    let fullyDilutedValuation: Double?
    let totalVolume: Double?
    let high24H: Double?
    let low24H: Double?
    let priceChange24H: Double?
    let priceChangePercentage24H: Double?
    let marketCapChange24H: Double?
    let marketCapChangePercentage24H: Double?
    let circulatingSupply: Double?
    let totalSupply: Double?
    let maxSupply: Double?
    let ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl: Double?
    let atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage1HInCurrency: Double?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage1HInCurrency = "price_change_percentage_1h_in_currency"
    }
    static let example = CoinModel(id: "sdad", symbol: "asdad", name: "asd", image: nil, currentPrice: nil, marketCap: nil, marketCapRank: nil, fullyDilutedValuation: nil, totalVolume: nil, high24H: nil, low24H: nil, priceChange24H: nil, priceChangePercentage24H: nil, marketCapChange24H: nil, marketCapChangePercentage24H: nil, circulatingSupply: nil, totalSupply: nil, maxSupply: nil, ath: nil, athChangePercentage: nil, athDate: nil, atl: nil, atlChangePercentage: nil, atlDate: nil, lastUpdated: nil, sparklineIn7D: nil, priceChangePercentage1HInCurrency: nil)
}

// MARK: - SparklineIn7D
struct SparklineIn7D: Codable {
    let price: [Double]?
}
