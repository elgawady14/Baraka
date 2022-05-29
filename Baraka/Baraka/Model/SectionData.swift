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
    var thirdSectionArticle: Article?

    init(stockTicker: StockTicker? = nil, secondSectionArticle: Article? = nil, thirdSectionArticle: Article? = nil) {
        self.stockTicker = stockTicker
        self.secondSectionArticle = secondSectionArticle
        self.thirdSectionArticle = thirdSectionArticle
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    private let identifier = UUID()
}
