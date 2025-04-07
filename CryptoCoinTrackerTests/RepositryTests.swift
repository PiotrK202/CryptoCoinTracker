//
//  RepositryTests.swift
//  CryptoCoinTrackerTests
//
//  Created by piotr koscielny on 7/4/25.
//

import Testing
@testable import CryptoCoinTracker

@Suite("Repository Tests") struct RepositryTests {

    @Test func RepositoryTestSuccess() async throws {
        let repository = RepositoryMock()
        let coins = try await repository.fetchCoins()
        
        #expect(coins.count > 0)
        #expect(coins[0].name == "Bitcoin")
    }

    @Test func RepositoryTestFailure() async throws {
        let repository = RepositoryMockFail()
        await #expect(throws: Error.self) {
            let _ = try await repository.fetchCoins()
        }
    }
}
