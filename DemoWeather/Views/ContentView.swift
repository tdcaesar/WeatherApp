//
//  ContentView.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/6/25.
//

import SwiftUI

let CurrentForecast = Forecast(days: [
    WeatherDay(day: .MON, weather: .Rainy, temperature: 74),
    WeatherDay(day: .TUE, weather: .PartlyCloudy, temperature: 75),
    WeatherDay(day: .WED, weather: .Tornado, temperature: 90),
    WeatherDay(day: .THR, weather: .Thunderstorm, temperature: 78),
    WeatherDay(day: .FRI, weather: .Clear, temperature: 79),
    WeatherDay(day: .SAT, weather: .Snowy, temperature: 80),
    WeatherDay(day: .SUN, weather: .Hail, temperature: 70)
])
let LocationName = "Atlanta, GA"

struct ContentView: View {
    
    @State private var isDayTime: Bool = true
    
    var body: some View {
        ZStack {
            BackgroundView(isDayTime: isDayTime)
                
            VStack {
                CityTextView(cityName: LocationName)
                CurrentWeatherView(
                    imageName: ImageSelector(isDayTime: isDayTime, weatherType: Weather.PartlyCloudy),
                    temperature: 76)
                ForecastView(Forecast: CurrentForecast)
                Spacer()
                Button
                {
                    isDayTime.toggle()
                } label: {
                    WeatherButtonView(
                        title: isDayTime ? "Switch to Night" : "Switch to Day",
                        textColor: .white,
                        backgroundColor: Color("Accent9"))
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct ForecastView: View {
    
    var Forecast: Forecast
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(Forecast.days, id: \.id) { weatherDay in
                WeatherDayView(forecastDay: weatherDay)
            }
        }
    }
}


struct WeatherDayView: View {
    
    var forecastDay : WeatherDay
        
    var body: some View {
        let dayName : String = forecastDay.day.rawValue
        let isWeekend: Bool = IsWeekend(day: forecastDay.day)
        let imageName: String = ImageSelector(isDayTime: true, weatherType: forecastDay.weather)

        VStack() {
            Text(dayName)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(isWeekend ? Color("Accent7") : .white)
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(forecastDay.temperature)°")
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                
        }
    }
}

struct BackgroundView: View {
    
    var isDayTime: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            isDayTime ? Color("Accent4") : Color("Accent2"),
            isDayTime ? Color("Accent1") : Color("Accent5")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct CurrentWeatherView: View {

    var imageName: String
    var temperature: Int

    var body: some View {
        VStack(spacing: 2) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


