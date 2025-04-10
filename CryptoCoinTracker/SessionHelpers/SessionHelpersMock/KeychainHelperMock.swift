//
//  KeychainHelperMock.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 10/4/25.
//

import Foundation

final class KeychainHelperMock: KeychainHelperProtocole {
    private var value: [String: String] = [:]
    
    func save(token: String, forKey key: String) {
        value[key] = token
    }
    
    func read(forKey key: String) -> String? {
        return value[key]
    }
    
    func deletUser() {
        value.removeAll()
    }
}
