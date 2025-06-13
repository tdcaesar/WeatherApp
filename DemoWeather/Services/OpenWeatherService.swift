//
//  WeatherService.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/12/25.
//

import Foundation
import CoreLocation

enum Units: String, Codable {
    case imperial
    case metric
    case standard
    
    func queryString() -> String {
        
        let prefix = "&units="
        
        switch self {
        case .imperial:
            return "\(prefix)imperial"
        case .metric:
            return "\(prefix)metric"
        case .standard:
            return "\(prefix)standard"
        }
    }
}

enum WeatherApi: String {
    case currentWeather = "weather"
    case forecastWeather = "forecast"
}


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

struct WeatherResponse: Decodable {
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct MainResponse: Decodable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Double
    var humidity: Double
}

struct WindResponse: Decodable {
    var speed: Double
    var deg: Double
    var gust: Double
}
struct ForecastMainResponse: Decodable {
    var temp: Double
    var feels_like: Double
    var temp_min: Double
    var temp_max: Double
    var pressure: Double
    var sea_level: Double
    var grnd_level: Double
    var humidity: Double
    var temp_kf: Double
}

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

struct ForecastWeatherResponse: Decodable {
    var city: City
    var country: String
    var population: Int64
    var timezone: Int
    var cod: String
    var message: Int
    var cnt: Int
    var list: [ForecastWeather]
    
    struct City: Decodable {
        var id: Int64
        var name: String
        var coord: CoordinateResponse
        
        struct CoordinateResponse: Decodable {
            var lat: Double
            var lon: Double
        }
    }
}
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
    
//    struct MainResponse: Decodable {
//        var temp: Double
//        var feels_like: Double
//        var temp_min: Double
//        var temp_max: Double
//        var pressure: Double
//        var humidity: Double
//    }
//    
//    struct WindResponse: Decodable {
//        var speed: Double
//        var deg: Double
//    }
}

extension MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
