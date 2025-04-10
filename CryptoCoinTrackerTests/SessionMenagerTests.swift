//
//  SessionMenagerTests.swift
//  CryptoCoinTrackerTests
//
//  Created by piotr koscielny on 10/4/25.
//

import Testing
@testable import CryptoCoinTracker

@Suite("SessionMenagerTests")struct SessionMenagerTests {

    @Test func isLoggedIn() {
        let session = SessionHelperMock(isLoggedIn: true)
        #expect(session.isLoggedIn == true)
        
        let session2 = SessionHelperMock(isLoggedIn: false)
        #expect(session2.isLoggedIn == false)
    }
}
