//
//  WeatherStartView.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/12/25.
//

import SwiftUI
import CoreLocation

struct WeatherStartView: View {
    
    @StateObject var locationService = LocationService()
    @StateObject var noaaWeatherService = NoaaWeatherService()
    @State var forecast: NoaaForecast?
    var noaaOfficeId: NoaaOfficeId?
    
    var body: some View {
        ZStack {
            BackgroundView(isDayTime: .constant(true))
            //TODO:  Move isDayTime to environment
            
            if let location = locationService.location {
                if let noaaOfficeId = noaaWeatherService.officeId {
                    if let forecast = forecast {
                        WeatherHomeView(office: noaaOfficeId, forecast: forecast)
                    } else {
                        LoadingView()
                            .task {
                                do {
                                    forecast = try await noaaWeatherService.getForecast(noaaOffice: noaaOfficeId)
                                } catch {
                                    //TODO:  Add error alert
                                    print("Failed to load current weather")
                                }
                            }
                    }
                } else {
                    LoadingView()
                        .task {
                            do {
                                _ = try await noaaWeatherService.requestOffice(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                //TODO: Add error alert
                                print("Failed to find the correct NOAA office")
                            }
                        }
                }
            } else {
                if locationService.isLoading {
                    ProgressView()
                } else {
                    LocationView()
                        .environmentObject(locationService)
                }
            }
        }
    }
}

#Preview {
    WeatherStartView(noaaOfficeId: MockNoaaData.previewOfficeId)
}
