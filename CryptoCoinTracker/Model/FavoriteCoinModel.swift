//
//  FavoriteCoinModel.swift
//  CryptoCoinTracker
//
//  Created by piotr koscielny on 8/4/25.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class FavoriteCoinModel {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
