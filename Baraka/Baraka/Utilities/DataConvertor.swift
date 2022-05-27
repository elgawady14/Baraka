//
//  DataConvertor.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 27/05/2022.
//

import Foundation

class DataConvertor {
    
    static func fetchStockTickers() -> [StockTicker] {
        guard let csvString = CSVParser.readDataFromCSV(fileName: "StockTickers", fileType: "csv") else {
            debugPrint("Error in reading the CSV file!")
            return []
        }
        let csvDictionary = CSVParser.convertCSVString(toDictionary: csvString)
        var result = [StockTicker]()
        for key in csvDictionary.keys {
            result.append(StockTicker(symbol: key, prices: csvDictionary[key]!))
        }
        return result
    }
}
