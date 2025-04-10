//
//  SessionHelper.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 9/4/25.
//

import Foundation
protocol SessionHelperProtocole {
    var isLoggedIn: Bool {get set}
    
}

struct SessionHelper: SessionHelperProtocole {    
    private static let isLoggedInKey = "isLoggedIn"
    
        var isLoggedIn: Bool {
            get { UserDefaults.standard.bool(forKey: SessionHelper.isLoggedInKey) }
            set { UserDefaults.standard.set(newValue, forKey: SessionHelper.isLoggedInKey) }
    }
}


