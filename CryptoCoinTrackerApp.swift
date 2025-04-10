//
//  CryptoCoinTrackerApp.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 3/4/25.
//
import SwiftData
import SwiftUI

@main
struct CryptoCoinTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            CoinListView(viewModel: CoinListViewModel(coinRepository: Repository(dataService: DataService()), sessionHelper: SessionHelper()))
        }
        .modelContainer(for: FavoriteCoinModel.self)
    }
}
