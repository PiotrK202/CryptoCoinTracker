//
//  LoginVMTests.swift
//  CryptoCoinTrackerTests
//
//  Created by piotr koscielny on 9/4/25.
//

import Testing
@testable import CryptoCoinTracker

@Suite("LoginViewModelTests")struct LoginVMTests {

    let viewModel = LoginViewModel(sessionMenager: SessionHelper())
    
    @Test func emptyFieldsFail() {
        let result = viewModel.isValidLogin(userName: "", password: "")
        #expect(result == " Pleas fill all fields")
    }
    @Test func wrongUserNameFail() {
        KeychainHelper.shared.save(token: "goodUserName", forKey: KeychainHelper.userName)
        KeychainHelper.shared.save(token: "goodPassword", forKey: KeychainHelper.password)
        
        let result = viewModel.isValidLogin(userName:"Wrong" ,password: "goodPassword")
        #expect(result == "Invalid username")
    }
    @Test func wrongPasswordFail() {
        KeychainHelper.shared.save(token: "goodUserName", forKey: KeychainHelper.userName)
        KeychainHelper.shared.save(token: "goodPassword", forKey: KeychainHelper.password)
        
        let result = viewModel.isValidLogin(userName:"goodUserName" ,password: "wrongPassword")
        #expect(result == "Incorrect password" )
    }
    
    @Test func loginSuccess() {
        KeychainHelper.shared.save(token: "goodUserName", forKey: KeychainHelper.userName)
        KeychainHelper.shared.save(token: "goodPassword", forKey: KeychainHelper.password)
        
        let result = viewModel.isValidLogin(userName: "goodUserName", password: "goodPassword")
        #expect(result == nil)
    }
}
