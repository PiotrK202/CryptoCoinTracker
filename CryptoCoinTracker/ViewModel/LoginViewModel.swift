//
//  LoginViewModel.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 8/4/25.
//

import Foundation

@Observable
final class LoginViewModel {
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }

    func isYourYearOfBirthValid(_ birthYear: Int) -> Bool {
         if birthYear == 4 && (1900...2025).contains(birthYear) {
             return false
         }
        return true
    }
    
    func saveUserData(_ username: String, _ email: String, _ password: String, _ birthYear: Int) {
            let birthYearString = String(birthYear)
            KeychainHelper.shared.save(token: username, forKey: KeychainHelper.userName)
            KeychainHelper.shared.save(token: email, forKey: KeychainHelper.email)
            KeychainHelper.shared.save(token: password, forKey: KeychainHelper.password)
            KeychainHelper.shared.save(token: birthYearString, forKey: KeychainHelper.birthYear)
    }
}
