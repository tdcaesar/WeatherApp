//
//  ForecastWeatherResponse.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/13/25.
//


import Foundation
import CoreLocation

struct ForecastWeatherResponse: Decodable {
    var city: City
    var country: String
    var population: Int64
    var timezone: Int
    var cod: String
    var message: Int
    var cnt: Int
    var list: [ForecastWeather]
    
    struct City: Decodable {
        var id: Int64
        var name: String
        var coord: CoordinateResponse
        
        struct CoordinateResponse: Decodable {
            var lat: Double
            var lon: Double
        }
    }
}