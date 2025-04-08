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
    var currentPrice: Double?
    
    init(name: String, currentPrice: Double?) {
        self.name = name
        self.currentPrice = currentPrice
    }
}
