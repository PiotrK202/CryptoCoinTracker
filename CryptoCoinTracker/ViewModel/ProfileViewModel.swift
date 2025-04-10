//
//  ProfileViewModel.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 8/4/25.
//

import Foundation
import SwiftData

@Observable
final class ProfileViewModel {
    
    private var sessionHelper: SessionHelperProtocole
    
    init(sessionHelper: SessionHelperProtocole) {
        self.sessionHelper = sessionHelper
    }
    
    func loggOut() {
       sessionHelper.isLoggedIn = false
    }
    
    var userName = KeychainHelper.shared.read(forKey: KeychainHelper.userName)
    var email = KeychainHelper.shared.read(forKey: KeychainHelper.email)
    var birthYear = KeychainHelper.shared.read(forKey: KeychainHelper.birthYear)
    
    func deletCoin(_ modelContext: ModelContext) {
        do {
            try modelContext.delete(model: FavoriteCoinModel.self)
        } catch {
            print("failed to delete")
        }
    }
}
