//
//  NoaaOfficeId.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/13/25.
//


import Foundation
import CoreLocation

struct NoaaOfficeId {
    var city: String
    var state: String
    var cwa: String
    var gridX: Int
    var gridY: Int
    
    var cityAndState: String { get { "\(city), \(state)" } }
}