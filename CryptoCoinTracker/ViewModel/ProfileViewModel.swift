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
    let userName = KeychainHelper.shared.read(forKey: KeychainHelper.userName)
    let email = KeychainHelper.shared.read(forKey: KeychainHelper.email)
    let birthYear = KeychainHelper.shared.read(forKey: KeychainHelper.birthYear)
    
    func deletCoins(_ modelContext: ModelContext) {
        KeychainHelper.shared.deletUser()
        do {
            try modelContext.delete(model: FavoriteCoinModel.self)
        } catch {
            print("failed to delete")
        }
    }
}
