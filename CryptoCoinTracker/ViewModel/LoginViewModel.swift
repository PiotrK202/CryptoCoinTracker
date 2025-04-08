//
//  LoginViewModel.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 8/4/25.
//

import Foundation

@Observable
final class LoginViewModel {
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    private func isYourYearOfBirthValid(_ birthYear: Int) -> Bool {
        (1900...2025).contains(birthYear)
    }
    
    private func isUserNameValid(_ userName: String) -> Bool {
        userName.count >= 4
    }
    
    private func isPasswordValid(_ password: String) -> Bool {
        password.count >= 8
    }
    
    func saveUserData(_ username: String, _ email: String, _ password: String, _ birthYear: Int) {
        let birthYearString = String(birthYear)
        KeychainHelper.shared.save(token: username, forKey: KeychainHelper.userName)
        KeychainHelper.shared.save(token: email, forKey: KeychainHelper.email)
        KeychainHelper.shared.save(token: password, forKey: KeychainHelper.password)
        KeychainHelper.shared.save(token: birthYearString, forKey: KeychainHelper.birthYear)
    }
    
    func validateUser(_ username: String, _ email: String, _ password: String, _ birthYear: Int) -> String? {
        if !isUserNameValid(username) {
            return "Username must be at least 4 characters"
        }
        if !isValidEmail(email) {
            return "Invalid email"
        }
        if !isPasswordValid(password) {
            return "Password must be at least 8 characters"
        }
        if !isYourYearOfBirthValid(birthYear) {
            return "You must be between 1900 and 2025"
        }
        return nil
    }
    
}
