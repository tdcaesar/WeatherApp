//
//  NoaaOffice.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/13/25.
//


import Foundation
import CoreLocation

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