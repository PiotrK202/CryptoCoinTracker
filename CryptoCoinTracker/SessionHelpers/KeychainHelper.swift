//
//  KeychainHelper.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 7/4/25.
//

import Foundation
import Security

protocol KeychainHelperProtocole {
    func save(token: String, forKey key: String)
    func read(forKey key: String) -> String?
    func deletUser()
}

final class KeychainHelper: KeychainHelperProtocole {
 
    static let shared = KeychainHelper()
    static let userName = "userName"
    static let email = "email"
    static let password = "password"
    static let birthYear = "birthYear"
    
    func save(token: String, forKey key: String) {
        if let data = token.data(using: .utf8) {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrAccount as String: key,
                kSecValueData as String: data
                
            ]
            
            SecItemDelete(query as CFDictionary)
            SecItemAdd(query as CFDictionary, nil)
        }
    }
    
    func read(forKey key: String) -> String? {
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: true
        ]
        var item: AnyObject?
        SecItemCopyMatching(query as CFDictionary, &item)
        
        
        if let data = item as? Data, let string = String(data: data, encoding: .utf8) {
            return string
        }
        return nil
    }
    
    private func delet(forKey key: String) {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key
        ]
        SecItemDelete(query as CFDictionary)
    }
    
    func deletUser() {
        let keys = [KeychainHelper.birthYear, KeychainHelper.email, KeychainHelper.password, KeychainHelper.userName]
        for key in keys {
            delet(forKey: key)
        }
    }
}
