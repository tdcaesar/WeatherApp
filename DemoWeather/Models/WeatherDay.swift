//
//  WeatherDay.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/6/25.
//


import SwiftUI

struct WeatherDay {
    let id = UUID()
    var day: Day
    var weather: Weather
    var temperature: Int
}
