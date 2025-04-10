//
//  KeychainHelperTests.swift
//  CryptoCoinTrackerTests
//
//  Created by piotr koscielny on 9/4/25.
//

import Testing
@testable import CryptoCoinTracker

@Suite("KeychainTests")struct KeychainHelperTests {
    let keychain = KeychainHelperMock()

    @Test func saveAndLoadData() {
        keychain.save(token: "1234", forKey: "password")
        let value = keychain.read(forKey: "password")
        #expect(value == "1234")
    }
    
    @Test func deleteData() {
        keychain.save(token: "1234", forKey: "password")
        keychain.deletUser()
        let value = keychain.read(forKey: "password")
        #expect(value == nil)
    }
}
