//
//  ModelData.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/12/25.
//

import Foundation

struct MockNoaaData {
    static var previewOfficeId = NoaaOfficeId(city: "New York", state: "NY", cwa: "OKX", gridX: 36, gridY: 36)
    static var previewNoaaForecast: NoaaForecast = load("noaaForecast.json")
}

var previewWeather: CurrentWeatherResponse = load("weatherData.json")
var previewForecast: ForecastThreeHourWeatherResponse = load("forecastData.json")
var previewOffice: NoaaOffice = load("noaaOfficeData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
