//
//  MockData.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/12/25.
//

import Foundation

struct MockData {
    static let defaultDayTime = true
    
    static let UnknownWeather = WeatherDay(day: .SUN, weather: .Unknown, temperature: Double(Int.min))
    static let TodayWeather = WeatherDay(day: .SUN, weather: .PartlyCloudy, temperature: 76)
    
    static let UnknownForecastWeek = Forecast(days: [
        UnknownWeather,
        UnknownWeather,
        UnknownWeather,
        UnknownWeather,
        UnknownWeather,
        UnknownWeather,
        UnknownWeather
    ])
    static let ForecastWeek = Forecast(days: [
        WeatherDay(day: .MON, weather: .Rainy, temperature: 74),
        WeatherDay(day: .TUE, weather: .PartlyCloudy, temperature: 75),
        WeatherDay(day: .WED, weather: .Tornado, temperature: 90),
        WeatherDay(day: .THR, weather: .Thunderstorm, temperature: 78),
        WeatherDay(day: .FRI, weather: .Clear, temperature: 79),
        WeatherDay(day: .SAT, weather: .Snowy, temperature: 80),
        WeatherDay(day: .SUN, weather: .Hail, temperature: 70)
    ])
    static let LocationName = "Atlanta, GA"
    static let UnknownLocationName = "Unknown Location"
    
    static let weatherViewModel = WeatherHomeViewModel(
        isDayTime: defaultDayTime,
        LocationName: MockData.LocationName,
        currentWeather: MockData.TodayWeather,
        forecast: MockData.ForecastWeek
    )
    static let unknownWeatherViewModel = WeatherHomeViewModel(
        isDayTime: defaultDayTime,
        LocationName: MockData.UnknownLocationName,
        currentWeather: MockData.UnknownWeather,
        forecast: MockData.UnknownForecastWeek
    )
}
