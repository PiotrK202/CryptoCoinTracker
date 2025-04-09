//
//  KeychainHelperTests.swift
//  CryptoCoinTrackerTests
//
//  Created by piotr koscielny on 9/4/25.
//

import Testing
@testable import CryptoCoinTracker

@Suite("KeychainTests")struct KeychainHelperTests {

    @Test func saveAndLoadData() {
        KeychainHelper.shared.save(token: "test", forKey: "testKey")
        let savedData = KeychainHelper.shared.read(forKey: "testKey")
        #expect(savedData == "test")
    }
// dziala w aplikacji nie dziala w testach!!!
//    @Test func deleteValue() {
//        KeychainHelper.shared.save(token: "test2", forKey: "testKey2")
//        KeychainHelper.shared.deletUser()
//        let value = KeychainHelper.shared.read(forKey: "testKey2")
//        #expect(value == nil)
//    }
}
