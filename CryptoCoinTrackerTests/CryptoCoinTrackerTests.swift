//
//  CryptoCoinTrackerTests.swift
//  CryptoCoinTrackerTests
//
//  Created by piotr koscielny on 4/4/25.
//

import Testing
@testable import CryptoCoinTracker

@Suite("DataServiceTest") struct DataServiceTest {
    
    @Test func fetchCoinsTestSuccess() async throws {
        let dataService = DataServiceMock()
        let coins: [CoinModel] = try await dataService.fetchData(from: "asd")
        
        #expect(coins.count > 0)
        #expect(coins[0].id == "bitcoin")
    }
    
    @Test func fetchCoinsTestFailure() async throws {
        let dataService = DataServiceMockFail()
        
        await #expect(throws: Error.self) {
            let _: [CoinModel] = try await dataService.fetchData(from: "asd")
        }
    }
}

