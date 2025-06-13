//
//  CurrentWeatherResponse.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/13/25.
//


import Foundation
import CoreLocation

struct CurrentWeatherResponse: Decodable {
    var coord: CoordinateResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinateResponse: Decodable {
        var lon: Double
        var lat: Double
    }
}