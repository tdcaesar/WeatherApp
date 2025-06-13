//
//  ForecastWeather.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/13/25.
//


import Foundation
import CoreLocation

struct ForecastWeather: Decodable {
    var dt: Int64
    var sunrise: Int64
    var sunset: Int64
    var temp: TempResponse
    var feels_like: FeelsLikeResponse
    var pressure: Int
    var humidity: Int
    var weather: [WeatherResponse]
    var speed: Double
    var deg: Double
    var guess: Double
    var clouds: Int
    var pop: Double
    var rain: Double?
  
    struct TempResponse: Decodable {
        var day: Double
        var min: Double
        var max: Double
        var night: Double
        var eve: Double
        var morn: Double
    }
    
    struct FeelsLikeResponse: Decodable {
        var day: Double
        var night: Double
        var eve: Double
        var morn: Double
    }
}