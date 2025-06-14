//
//  WindResponse.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/13/25.
//


import Foundation
import CoreLocation

struct WindResponse: Decodable {
    var speed: Double
    var deg: Double
    var gust: Double
}