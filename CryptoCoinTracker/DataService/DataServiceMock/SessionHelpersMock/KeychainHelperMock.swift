//
//  KeychainHelperMock.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 10/4/25.
//

import Foundation

final class KeychainHelperMock: KeychainHelperProtocole {
    func save(token: String, forKey key: String) {
        
    }
    
    func read(forKey key: String) -> String? {
        return nil
    }
    
    func deletUser() {
        
    }
}
