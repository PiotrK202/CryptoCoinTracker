//
//  KeychainHelper.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 7/4/25.
//

import Foundation
import Security

class KeychainHelper {
    static let shared = KeychainHelper()
    
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
    
}
