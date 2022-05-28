//
//  StockTicker.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 27/05/2022.
//

import Foundation

struct StockTicker: Hashable {
    var symbol: String
    var prices: [Double]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    private let identifier = UUID()
}
