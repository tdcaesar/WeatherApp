//
//  WeatherHomeViewModel.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/12/25.
//

import Foundation

final class WeatherHomeViewModel: ObservableObject {
    
    @Published var isDayTime: Bool
    @Published var LocationName: String
    @Published var currentWeather: WeatherDay
    @Published var forecast: Forecast
    
    private var locationService = LocationService()
    var buttonText: String { get { "Switch to \(isDayTime ? "Night" : "Day")" } }
        
    init(weatherData: CurrentWeatherResponse) {
        self.isDayTime = true
        self.LocationName = weatherData.name
        self.currentWeather = WeatherDay(day: .MON, weather: .Clear, temperature: weatherData.main.temp)
        self.forecast = Forecast(days: [])
    }
    
    init(isDayTime: Bool, LocationName: String, currentWeather: WeatherDay, forecast: Forecast) {
        self.isDayTime = isDayTime
        self.LocationName = LocationName
        self.currentWeather = currentWeather
        self.forecast = forecast
    }
    
    init() {
        self.isDayTime = true
        self.LocationName = "Unknown Location"
        self.currentWeather = WeatherDay(day: .MON, weather: .Unknown, temperature: Double(Int.min))
        self.forecast = Forecast(days: [])
    }
}
