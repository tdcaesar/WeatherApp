//
//  WeatherService.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/12/25.
//

import Foundation
import CoreLocation

class OpenWeatherService {
    
    private var baseURLString = "https://api.openweathermap.org/data/2.5/"
    private var apiKey = "9acf26acdba69b09ff39de3ce644dba4"
    private var units: Units = .imperial
    
    func getUrlString(lattitude: String, longitude: String, api: String) -> String {
        return "\(baseURLString)\(api)?lat=\(lattitude)&lon=\(longitude)&appid=\(apiKey)\(units.queryString())"
    }

    func getCurrentWeather(lattitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> CurrentWeatherResponse {
        guard let url = URL(string: getUrlString(lattitude: lattitude.description,
                                                 longitude: longitude.description,
                                                 api: "weather"
                                                )) else { fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data.")}
        
        let decodedData = try JSONDecoder().decode(CurrentWeatherResponse.self, from: data)
        
        return decodedData
    }
    
    
    func getForecastWeather(lattitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ForecastWeatherResponse {
        let urlString = getUrlString(lattitude: lattitude.description,
                                     longitude: longitude.description,
                                     api: "daily")
        guard let url = URL(string: urlString) else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching forecast data.")
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(ForecastWeatherResponse.self, from: data)
        } catch {
            fatalError("Error decoding data.")
        }
        
        //return decodedData
    }
    
    func getForecasThreeHourtWeather(lattitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ForecastThreeHourWeatherResponse {
        let urlString = getUrlString(lattitude: lattitude.description,
                                     longitude: longitude.description,
                                     api: "forecast")
        guard let url = URL(string: urlString) else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching forecast data.")
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(ForecastThreeHourWeatherResponse.self, from: data)
        } catch {
            fatalError("Error decoding data.")
        }
        
        //return decodedData
    }
}

















