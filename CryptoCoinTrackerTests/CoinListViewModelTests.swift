//
//  CoinListViewModelTests.swift
//  CryptoCoinTrackerTests
//
//  Created by piotr koscielny on 7/4/25.
//

import Testing
@testable import CryptoCoinTracker

@Suite("CoinListViewModelTests") struct CoinListViewModelTests {
    
    @Test func fetchCoinsViewModelTest() async throws {
        let repostiory = Repository(dataService: DataServiceMock())
        let viewModel = CoinListViewModel(coinRepository: repostiory)
        
        try await viewModel.fetchCoin()
        
        #expect(viewModel.coins.count > 0)
        #expect(viewModel.coins.first?.name == "Bitcoin")
        #expect(viewModel.coins.first?.currentPrice == 50000.0)
    }
    
}
