//
//  ForecastThreeHourWeather.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/13/25.
//


import Foundation
import CoreLocation

struct ForecastThreeHourWeather: Decodable {
    var dt: Int64
    var main: ForecastMainResponse
    var weather: [WeatherResponse]
    var clouds: CloudsResponse
    var wind: WindResponse
    var visibility: Int
    var pop: Double
    var rain: Dictionary<String, Double>?
    var sys: SysResponse
    var dt_txt: String
    
    struct CloudsResponse: Decodable {
        var all: Int
    }
    
    struct SysResponse: Decodable {
        var pod: String
    }
    
    struct RainResponse: Decodable, Equatable {
        let three: Double
        
        private enum CodingKeys: String, CodingKey {
            case three = "3h"
        }
    }
}