//
//  Units.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/13/25.
//


import Foundation
import CoreLocation

enum Units: String, Codable {
    case imperial
    case metric
    case standard
    
    func queryString() -> String {
        
        let prefix = "&units="
        
        switch self {
        case .imperial:
            return "\(prefix)imperial"
        case .metric:
            return "\(prefix)metric"
        case .standard:
            return "\(prefix)standard"
        }
    }
}