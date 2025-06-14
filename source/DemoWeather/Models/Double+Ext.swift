//
//  Double+Ext.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/12/25.
//

import Foundation

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f",self)
    }
    func DoubleFromIntMin() -> Double {
        return Double(Int.min)
    }
}
