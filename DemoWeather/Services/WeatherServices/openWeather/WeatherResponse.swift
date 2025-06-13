//
//  WeatherResponse.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/13/25.
//


import Foundation
import CoreLocation

struct WeatherResponse: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}