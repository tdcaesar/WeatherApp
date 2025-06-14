//
//  MainResponse.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/13/25.
//


import Foundation
import CoreLocation

struct MainResponse: Decodable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Double
    var humidity: Double
}