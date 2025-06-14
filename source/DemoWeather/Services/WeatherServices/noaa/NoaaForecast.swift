//
//  NoaaForecast.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/13/25.
//


import Foundation
import CoreLocation

struct NoaaForecast: Decodable {
    var type: String
    var geometry: Geometry
    var properties: Properties
    
    struct Geometry: Decodable {
        var type: String
        var coordinates: Array<Array<Array<Double>>>
    }
    
    
    struct Properties: Decodable {
        var units: String
        var forecastGenerator: String
        var generatedAt: String
        var updateTime: String
        var validTimes: String
        var elevation: UnitValue
        var periods: [NoaaDailyWeather]
    }
    struct UnitValue: Decodable {
        var unitCode: String
        var value: Double
    }
    struct NoaaDailyWeather: Decodable {
        var number: Int
        var name: String
        var startTime: String
        var endTime: String
        var isDaytime: Bool
        var temperature: Int
        var temperatureUnit: String
        var temperatureTrend: String?
        var probabilityOfPrecipitation: UnitValue?
        var windSpeed: String
        var windDirection: String
        var icon: String
        var shortForecast: String
        var detailedForecast: String
    }
}