//
//  ForecastThreeHourWeatherResponse.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/13/25.
//


import Foundation
import CoreLocation

struct ForecastThreeHourWeatherResponse: Decodable {
    var cod: String
    var message: Int
    var cnt: Int
    var list: [ForecastThreeHourWeather]
    var city: City
    
    struct City: Decodable {
        var id: Int64
        var name: String
        var coord: CoordinateResponse
        var country: String
        var population: Int64
        var timezone: Int
        var sunrise: Int64
        var sunset: Int64
        
        struct CoordinateResponse: Decodable {
            var lat: Double
            var lon: Double
        }
    }
}