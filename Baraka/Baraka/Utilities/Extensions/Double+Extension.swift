//
//  Double+Extension.swift
//  Baraka
//
//  Created by Ahmed Abduljawad on 27/05/2022.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func round(toPlaces places:Int = 2) -> Double {
        let isInteger = floor(self) == self // true
        if !isInteger {
            let divisor = pow(10, Double(places))
            return Darwin.round(self * divisor) / divisor
        } else {
            return self
        }
    }
}
