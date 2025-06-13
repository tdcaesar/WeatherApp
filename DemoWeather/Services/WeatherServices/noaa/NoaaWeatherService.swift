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
