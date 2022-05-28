//
//  SectionData.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 28/05/2022.
//

import Foundation

struct SectionData: Hashable {
    var stockTicker: StockTicker?
    var secondSectionArticle: Article?
    
    init(stockTicker: StockTicker? = nil, article: Article? = nil) {
        self.stockTicker = stockTicker
        self.secondSectionArticle = article
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    private let identifier = UUID()
}
