//
//  SessionHelper.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 9/4/25.
//

import Foundation

struct SessionHelper {
    static let isLoggedInKey = "isLoggedIn"
    
    static var isLoggedIn: Bool {
        get { UserDefaults.standard.bool(forKey: isLoggedInKey) }
        set { UserDefaults.standard.set(newValue, forKey: isLoggedInKey) }
    }
}
