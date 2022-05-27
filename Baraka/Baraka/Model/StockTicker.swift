//
//  StockTicker.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 27/05/2022.
//

import Foundation

struct StockTicker: Encodable {
    var symbol: String
    var prices: [Double]
    
    enum CodingKeys: String, CodingKey {
        case symbol = ""
    }
}
