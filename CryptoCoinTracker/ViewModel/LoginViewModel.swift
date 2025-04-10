//
//  LoginViewModel.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 8/4/25.
//

import Foundation

@Observable
final class LoginViewModel {
    private var sessionMenager: SessionHelperProtocole
    
    init(sessionMenager: SessionHelperProtocole) {
        self.sessionMenager = sessionMenager
    }
    
    func isLoggedIn() {
        sessionMenager.isLoggedIn = true
    }
    
    func isValidLogin(userName: String, password: String) -> String? {
        if userName.isEmpty || password.isEmpty {
            return " Pleas fill all fields"
        }
        let storedUserName = KeychainHelper.shared.read(forKey: KeychainHelper.userName)
        let storedPassword = KeychainHelper.shared.read(forKey: KeychainHelper.password)
        
        if storedUserName != userName {
            return "Invalid username"
        }
        
        if storedPassword != password {
            return "Incorrect password"
        }
        return nil
    }
}
