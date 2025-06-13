//
//  NoaaWeatherService.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/13/25.
//

import Foundation
import CoreLocation

class NoaaWeatherService: ObservableObject {
    
    @Published var officeId: NoaaOfficeId?
    @Published var isLoading = false
    
//    func requestOffice(latitude: CLLocationDegrees, longitude: CLLocationDegrees) -> NoaaOfficeId {
//        isLoading = true
//        Task {
//            var noaaOffice: NoaaOffice
//            do {
//                noaaOffice = try await getOffice(latitude: latitude, longitude: longitude)
//                officeId = NoaaOfficeId(city: noaaOffice.properties.relativeLocation.properties.city, state: noaaOffice.properties.relativeLocation.properties.state, cwa: noaaOffice.properties.cwa, gridX: noaaOffice.properties.gridX, gridY: noaaOffice.properties.gridY)
//                isLoading = false
//                return try officeId
//            } catch {
//                fatalError( "Unable to retrieve NOAA weather station online from current GPS coordinates (\(latitude.roundDouble()), \(longitude.roundDouble())). ")
//            }
//            
//            isLoading = false
//        }
//        return officeId!
//    }
    func requestOffice(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> NoaaOfficeId? {
        isLoading = true
        var noaaOffice: NoaaOffice
        
        do {
            noaaOffice = try await getOffice(latitude: latitude, longitude: longitude)
        } catch {
            fatalError( "Unable to retrieve NOAA weather station online from current GPS coordinates (\(latitude.roundDouble()), \(longitude.roundDouble())). ")
        }
        officeId = NoaaOfficeId(city: noaaOffice.properties.relativeLocation.properties.city, state: noaaOffice.properties.relativeLocation.properties.state, cwa: noaaOffice.properties.cwa, gridX: noaaOffice.properties.gridX, gridY: noaaOffice.properties.gridY)
        isLoading = false
        return officeId
    }
    
    
    let baseURLString = "https://api.weather.gov/"
    
    func getOffice(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> NoaaOffice {
        let url = baseURLString + "points/\(latitude),\(longitude)"
        
        guard let url = URL(string: url) else {
            fatalError("Failed to load from \(url)")
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching forecast data.")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(NoaaOffice.self, from: data)
        } catch {
            print(error)
            fatalError(error.localizedDescription)
        }
    }
    func getForecast(noaaOffice: NoaaOfficeId) async throws -> NoaaForecast {
        let url = "\(baseURLString)/gridpoints/\(noaaOffice.cwa)/\(noaaOffice.gridX),\(noaaOffice.gridY)/forecast"
        
        guard let url = URL(string: url) else {
            fatalError("Failed to load from \(url)")
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching forecast data.")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(NoaaForecast.self, from: data)
        } catch {
            print(error)
            fatalError(error.localizedDescription)
        }
    }
}

struct NoaaOfficeId {
    var city: String
    var state: String
    var cwa: String
    var gridX: Int
    var gridY: Int
    
    var cityAndState: String { get { "\(city), \(state)" } }
}

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


struct NoaaOffice: Decodable {
    var context: Dictionary<String, String>?
    var id: String
    var type: String
    var geometry: Geometry
    var properties: Properties
    
    struct Geometry: Decodable {
        var type: String
        var coordinates: [Double]
    }
    struct Properties: Decodable {
        var id: String?
        var type: String?
        var cwa: String
        var forecastOffice: String
        var gridId: String
        var gridX: Int
        var gridY: Int
        var forecast: String
        var forecastHourly: String
        var forecastGridData: String
        var observationStations: String
        var relativeLocation: RelativeLocation
        var forecastZone: String
        var county: String
        var fireWeatherZone: String
        var timeZone: String
        var radarStation: String
        
        struct RelativeLocation: Decodable {
            var type: String
            var geometry: Geometry
            var properties: CityProperties
            
            struct CityProperties: Decodable {
                var city: String
                var state: String
                var distance: DistanceProperty
                var bearing: BearingProperty
                
                struct DistanceProperty: Decodable {
                    var unitCode: String
                    var value: Double
                }
                struct BearingProperty: Decodable {
                    var unitCode: String
                    var value: Int
                }
            }
        }
    }
}
