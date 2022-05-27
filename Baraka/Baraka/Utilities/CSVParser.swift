//
//  CSVParser.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 27/05/2022.
//

import Foundation

struct CSVParser {
    
    /// Convert data in a CSV file like `StockTickers.csv` into a dictionary with unique keys like ["APPL": [155.38184866788663, 233.69882718213734], "TESLA": [219.8936707828164, -22.71744309448843], .....]
    static func convertCSVString(toDictionary text: String) -> [String : [Double]] {
        var result: [String : [Double]] = [:]
        var rows = text.components(separatedBy: "\n")
        // Remove this line `"STOCK", "PRICE"`
        rows.remove(at: 0)
        for row in rows {
            let columns = row.components(separatedBy: ",")
            if columns.count == 2 {
                if result[columns.first!] != nil {
                    result[columns.first!]!.append(Double(columns.last!.replacingOccurrences(of: " ", with: ""))!)
                } else {
                    result[columns.first!] = [Double(columns.last!.replacingOccurrences(of: " ", with: ""))!]
                }
            }
        }
        return result
    }
    
    static func readDataFromCSV(fileName: String, fileType: String) -> String? {
        guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType) else {
            return nil
        }
        do {
            return try String(contentsOfFile: filepath, encoding: .utf8)
        } catch {
            debugPrint("File Read Error for file \(filepath)")
            return nil
        }
    }
    
    

}
