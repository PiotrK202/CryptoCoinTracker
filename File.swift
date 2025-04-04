//
//
//import Foundation
//
////View
//
//struct CoinListView: View {
//    
//    @State private var viewModel: CoinListViewModel
//    
//    init(viewModel: CoinListViewModel) {
//        self.viewModel = viewModel
//    }
//    
//    var body: some View {
//        NavigationStack {
//            List {
//                ForEach(viewModel.coins) { coin in
//                    NavigationLink(destination: CoinDetialView(viewModel: CoinDetailViewModel(coin: coin))) {
//                        HStack {
//                            AsyncImage(url: URL(string: coin.image ?? "")) { phase in
//                                if let image = phase.image {
//                                    image
//                                        .resizable()
//                                        .scaledToFit()
//                                        .frame(width: 44, height: 44)
//                                        .padding()
//                                } else if phase.error != nil {
//                                    Text("something went wrong")
//                                } else {
//                                    ProgressView()
//                                }
//                            }
//                            VStack {
//                                Text(coin.name)
//                                    .font(.headline)
//                            }
//                        }
//                    }
//                }
//            }
//            .onAppear {
//                Task {
//                    try await viewModel.fetchCoin()
//                }
//            }
//            .navigationTitle("Coins")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//}
//
//#Preview {
//    CoinListView(viewModel: CoinListViewModel(coinRepository: Repository(dataService: DataService())))
//}
//
////
////  CoinDataService.swift
//
//import Foundation
//
//struct DataService {
//    
//    private let decoder = JSONDecoder()
//    
//    func fetchData2<T: Decodable>(from request: URLRequest) async throws -> T {
//        let (data, response) = try await URLSession.shared.data(for: request)
//        
//        try httpResponse(response: response)
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        
//        return try decoder.decode(T.self, from: data)
//    }
//    
//    func fetchData<T: Decodable>(from urlString: String) async throws -> T {
//        guard let url = URL(string: urlString) else {
//            throw URLError(.badURL)
//        }
//        
//        let request = URLRequest(url: url,timeoutInterval: 10)
//        let (data, response) = try await URLSession.shared.data(for: request)
//        try httpResponse(response: response)
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
//        
//        return try decoder.decode(T.self, from: data)
//    }
//    
//    static func returnEndpoint(endpoint: Endpoints) -> URLRequest? {
//        guard let url = URL(string: endpoint.patch) else {
//            return nil
//        }
//        var request = URLRequest(url:url, timeoutInterval: 10)
//        request.httpMethod = endpoint.httpMethod.rawValue
//        request.httpBody = endpoint.data
//        
//        return request
//    }
//    
//    private func httpResponse(response: URLResponse ) throws {
//        guard let httpResponse = response as? HTTPURLResponse,
//              (200..<300).contains(httpResponse.statusCode) else {
//            throw URLError(.badServerResponse)
//        }
//    }
//}
//
//
//
////network layer 
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
//
//// repoository
//
//import Foundation
//
//struct Repository {
//    
//    private let dataService: DataService
//    
//    
//    init(dataService: DataService) {
//        self.dataService = dataService
//    }
//    
//    func fetchCoins() async throws -> [CoinModel] {
//        let url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false"
//        return try await dataService.fetchData(from: url)
//    }
//    
//    func callEndpoint1(model: CoinModel) async throws -> CoinModel? {
//        guard let request = DataService.returnEndpoint(endpoint: .endpoint1(model)) else { return nil }
//        return try await dataService.fetchData2(from: request)
//    }
//}
//
//// coinmodel
//
//
//import Foundation
//
//struct CoinModel: Codable, Identifiable {
//    let id, symbol, name: String
//    let image: String?
//    let currentPrice: Double?
//    let marketCap: Double?
//    let marketCapRank: Int?
//    let fullyDilutedValuation: Double?
//    let totalVolume: Double?
//    let high24H: Double?
//    let low24H: Double?
//    let priceChange24H: Double?
//    let priceChangePercentage24H: Double?
//    let marketCapChange24H: Double?
//    let marketCapChangePercentage24H: Double?
//    let circulatingSupply: Double?
//    let totalSupply: Double?
//    let maxSupply: Double?
//    let ath: Double?
//    let athChangePercentage: Double?
//    let athDate: String?
//    let atl: Double?
//    let atlChangePercentage: Double?
//    let atlDate: String?
//    let lastUpdated: String?
//    let sparklineIn7D: SparklineIn7D?
//    let priceChangePercentage1HInCurrency: Double?
//
//    enum CodingKeys: String, CodingKey {
//        case id, symbol, name, image
//        case currentPrice = "current_price"
//        case marketCap = "market_cap"
//        case marketCapRank = "market_cap_rank"
//        case fullyDilutedValuation = "fully_diluted_valuation"
//        case totalVolume = "total_volume"
//        case high24H = "high_24h"
//        case low24H = "low_24h"
//        case priceChange24H = "price_change_24h"
//        case priceChangePercentage24H = "price_change_percentage_24h"
//        case marketCapChange24H = "market_cap_change_24h"
//        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
//        case circulatingSupply = "circulating_supply"
//        case totalSupply = "total_supply"
//        case maxSupply = "max_supply"
//        case ath
//        case athChangePercentage = "ath_change_percentage"
//        case athDate = "ath_date"
//        case atl
//        case atlChangePercentage = "atl_change_percentage"
//        case atlDate = "atl_date"
//        case lastUpdated = "last_updated"
//        case sparklineIn7D = "sparkline_in_7d"
//        case priceChangePercentage1HInCurrency = "price_change_percentage_1h_in_currency"
//    }
//    static let example = CoinModel(id: "sdad", symbol: "asdad", name: "asd", image: nil, currentPrice: nil, marketCap: nil, marketCapRank: nil, fullyDilutedValuation: nil, totalVolume: nil, high24H: nil, low24H: nil, priceChange24H: nil, priceChangePercentage24H: nil, marketCapChange24H: nil, marketCapChangePercentage24H: nil, circulatingSupply: nil, totalSupply: nil, maxSupply: nil, ath: nil, athChangePercentage: nil, athDate: nil, atl: nil, atlChangePercentage: nil, atlDate: nil, lastUpdated: nil, sparklineIn7D: nil, priceChangePercentage1HInCurrency: nil)
//}
//
//// MARK: - SparklineIn7D
//struct SparklineIn7D: Codable {
//    let price: [Double]?
//}
//
//// detail view
//
//import SwiftUI
//
//struct CoinDetialView: View {
//    @State var viewModel: CoinDetailViewModel
//    
//    var body: some View {
//        VStack {
//            Text("ho")
//        }
//    }
//}
//
//#Preview {
//    CoinDetialView(viewModel: CoinDetailViewModel(coin: CoinModel.example))
//}
//
//// coin list viewmodel
//
//import Foundation
//
//@Observable
//class CoinListViewModel {
//    private let coinRepository: Repository
//    var coins = [CoinModel]()
//    
//    init(coinRepository: Repository) {
//        self.coinRepository = coinRepository
//    }
//    
//    @MainActor
//    func fetchCoin() async throws {
//        do {
//            let fetchedCoins: [CoinModel] = try await coinRepository.fetchCoins()
//            self.coins = fetchedCoins
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//}
//
//
//import SwiftUI
//
//@main
//struct CryptoCoinTrackerApp: App {
//    var body: some Scene {
//        WindowGroup {
//            CoinListView(viewModel: CoinListViewModel(coinRepository: Repository(dataService: DataService())))
//        }
//    }
//}
//
