//
//  ProfileViewModel.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 8/4/25.
//

import Foundation

@Observable
final class ProfileViewModel {
    let userName = KeychainHelper.shared.read(forKey: KeychainHelper.userName)
    let email = KeychainHelper.shared.read(forKey: KeychainHelper.email)
    let birthYear = KeychainHelper.shared.read(forKey: KeychainHelper.birthYear)
}
