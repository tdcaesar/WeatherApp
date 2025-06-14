//
//  MainResponse+Ext.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/13/25.
//


import Foundation
import CoreLocation

extension MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}