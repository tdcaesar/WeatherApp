//
//  Weather.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/6/25.
//


import SwiftUI

enum Weather {
    case Clear
    case Cloudy
    case PartlyCloudy
    case Rainy
    case Snowy
    case Thunderstorm
    case Tornado
    case Hail
    case Foggy
    case Windy
    case Unknown
    
    func ImageName(_ isDayTime: Bool)-> String {
        switch self {
        case .Clear:
            return isDayTime ? "sun.max.fill" : "moon.fill"
        case .Cloudy:
            return isDayTime ? "cloud.fill" : "cloud.fill"
        case .PartlyCloudy:
            return isDayTime ? "cloud.sun.fill" : "cloud.moon.fill"
        case .Rainy:
            return isDayTime ? "cloud.rain.fill" : "cloud.moon.rain.fill"
        case .Snowy:
            return "cloud.snow.fill"
        case .Thunderstorm:
            return isDayTime ? "cloud.bolt.rain.fill" : "cloud.moon.bolt.fill"
        case .Tornado:
            return "tornado"
        case .Hail:
            return "cloud.hail.fill"
        case .Foggy:
            return isDayTime ? "cloud.fog.fill" : "cloud.moon.fog.fill"
        case .Windy:
            return "wind"
        case .Unknown:
            return "circle.badge.questionmark"
        }
    }
}
