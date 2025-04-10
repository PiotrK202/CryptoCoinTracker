//
//  SingUpViewModelTests.swift
//  CryptoCoinTrackerTests
//
//  Created by piotr koscielny on 9/4/25.
//

import Testing
@testable import CryptoCoinTracker

@Suite("SignUpViewModelTests")struct SingUpViewModelTests {
    let viewModel = SignUpViewModel(sessionHelper: SessionHelper())
    
    @Test func wrongEmailFail() {
        let result = viewModel.validateUser("user", "wrong", "1234567899", 2000)
        #expect(result == "Invalid email")
    }
    
    @Test func wrongUserName() {
        let result = viewModel.validateUser("123", "user@mail.com", "1234567899", 2000)
        #expect(result == "Username must be at least 4 characters")
    }
    
    @Test func wrongPassword() {
        let result = viewModel.validateUser("user", "user@mail.com", "123", 2000)
        #expect(result == "Password must be at least 8 characters")
    }
    
    @Test func wrongYear() {
        let result = viewModel.validateUser("user", "user@mail.com", "1234567899", 200)
        #expect(result == "You must be between 1900 and 2025")
    }
    
    @Test func validUser() {
        let result = viewModel.validateUser("user", "user@mail.com", "1234567899", 2025)
        #expect(result == nil)
    }
}
