//
//  ContentView.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/6/25.
//

import SwiftUI

struct WeatherHomeView: View {
    
    @StateObject var viewModel = WeatherHomeViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView(isDayTime: viewModel.isDayTime)
                
            VStack {
                CityTextView(cityName: viewModel.LocationName)
                CurrentWeatherView(isDayTime: $viewModel.isDayTime, currentWeather: viewModel.currentWeather)
                ForecastView(isDayTime: $viewModel.isDayTime, Forecast: viewModel.forecast)
                Spacer()
                Button
                {
                    viewModel.isDayTime.toggle()
                } label: {
                    WeatherButtonView(
                        title: viewModel.buttonText,
                        textColor: .white,
                        backgroundColor: Color("Accent9"))
                }
                Spacer()
            }
        }
    }
}

#Preview {
    WeatherHomeView(viewModel: MockData.weatherViewModel)
    //WeatherHomeView(viewModel: MockData.unknownWeatherViewModel)
}


