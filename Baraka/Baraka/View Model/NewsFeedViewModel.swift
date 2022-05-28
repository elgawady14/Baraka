//
//  NewsFeedViewModel.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 27/05/2022.
//

import Foundation

class NewsFeedViewModel {
    var stockTickers: [StockTicker] = DataConvertor.fetchStockTickers()
}
