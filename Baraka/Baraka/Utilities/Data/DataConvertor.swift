//
//  DataConvertor.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 27/05/2022.
//

import Foundation

class DataConvertor {
    
    /// Convert a dictionary with unique keys like ["APPL": [155.38184866788663, 233.69882718213734], "TESLA": [219.8936707828164, -22.71744309448843]
    /// to an array of `StockTicker` data type
    static func fetchStockTickers() -> [StockTicker] {
        guard let csvString = Parser.readDataFromFile(name: Constants.StockTickersFileName, type: Constants.StockTickersFileType) else {
            debugPrint("Error in reading the CSV file!")
            return []
        }
        let csvDictionary = Parser.convertCSVString(toDictionary: csvString)
        var result = [StockTicker]()
        for key in csvDictionary.keys {
            result.append(StockTicker(symbol: key, prices: csvDictionary[key]!))
        }
        return result
    }
    
    /// Convert a string value in an object of `NewsFeed` data type.
    static func fetchNewsFeed() -> NewsFeed? {
        guard let jsonString = Parser.readDataFromFile(name: Constants.NewsFeedFileName, type: Constants.NewsFeedFileType) else {
            debugPrint("Error in reading the JSON file!")
            return nil
        }
        let jsonData = Data(jsonString.utf8)
        do {
            let newsFeed = try JSONDecoder().decode(NewsFeed.self, from: jsonData)
            return newsFeed
        } catch {
            debugPrint("Error in decoding the JSON data: \(error.localizedDescription)")
            return nil
        }
    }
    
}
