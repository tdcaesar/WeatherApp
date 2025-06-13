//
//  WeatherDay.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/6/25.
//


import SwiftUI

struct WeatherDay {
    let id = UUID()
    var day: Day = .MON
    var weather: Weather = Weather.Unknown
    var temperature: Double = Double(Int.min)
    
    var temperatureText: String { get { temperature == Double(Int.min) ? "-°" : "\(temperature)°" } }
}
