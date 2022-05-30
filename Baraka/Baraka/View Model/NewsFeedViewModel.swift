//
//  NewsFeedViewModel.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 27/05/2022.
//

import Foundation

class NewsFeedViewModel {
    
    var stockTickers: [SectionData] = DataConvertor.fetchStockTickers().map {
        SectionData(stockTicker: $0)
    }
    var popularNewsFeed: [SectionData] = (DataConvertor.fetchNewsFeed()?.articles.prefix(6) ?? []).map { SectionData(secondSectionArticle: $0) }
    var remindedNewsFeed: [SectionData] = (DataConvertor.fetchNewsFeed()?.articles.suffix(from: 6) ?? []).map { SectionData(thirdSectionArticle: $0) }
    var timer: Timer?
    var isLoadingNewPrices: CustomBinding<Bool> = CustomBinding(false)
    
    init() { startTimer() }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
}

extension NewsFeedViewModel {
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: Constants.PricesTimeInterval, target: self, selector: #selector(loadNewPrices), userInfo: nil, repeats: true)
    }
    
    @objc func loadNewPrices() {
        isLoadingNewPrices.value = true
    }
}
