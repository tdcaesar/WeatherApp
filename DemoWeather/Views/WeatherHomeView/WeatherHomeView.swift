////
////  ContentView.swift
////  DemoWeather
////
////  Created by Eric DeCesare on 6/6/25.
////

import SwiftUI

struct WeatherHomeView: View {

    @State var office: NoaaOfficeId
    @State var forecast: NoaaForecast
    @StateObject var viewModel = WeatherHomeViewModel()
    
    var body: some View {
        
        ZStack {
            BackgroundView(isDayTime: $viewModel.isDayTime)
            
            VStack {
                CityTextView(cityName: office.cityAndState)
                CurrentWeatherView(isDayTime: $viewModel.isDayTime, currentWeather: forecast.properties.periods[0])
                ForecastView(isDayTime: $viewModel.isDayTime, forecast: $forecast)
                Spacer()
                Button
                {
                    viewModel.isDayTime.toggle()
                } label: {
                    WeatherButtonView(
                        title: viewModel.buttonText,
                        textColor: .white,
                        backgroundColor: Color(.accent))
                }
                Spacer()
            }            
        }
    }
}

#Preview {
    WeatherHomeView(office: previewOfficeId, forecast: previewNoaaForecast, viewModel: MockData.weatherViewModel)
    //WeatherHomeView(viewModel: MockData.unknownWeatherViewModel)
}


