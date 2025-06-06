//
//  ContentView.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(
                topColor: Color("Accent1"),
                bottomColor: Color("Accent2"))
            VStack {
                CityTextView(cityName: "Atlanta, GA")
                CurrentWeatherView(
                    imageName: "cloud.sun.fill",
                    temperature: 76)
                
                HStack(spacing: 10) {
                    WeatherDayView(
                        dayOfWeek: "MON",
                        imageName: "cloud.rain.fill", temperature: 74)
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: "cloud.sun.fill", temperature: 75)
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "tornado", temperature: 90)
                    WeatherDayView(
                        dayOfWeek: "THR",
                        imageName: "sun.max.fill", temperature: 78)
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        imageName: "sun.max.fill", temperature: 79)
                    WeatherWeekendView(
                        dayOfWeek: "SAT",
                        imageName: "cloud.hail.fill", temperature: 80)
                    WeatherWeekendView(
                        dayOfWeek: "SUN",
                        imageName: "cloud.sun.fill", temperature: 70)
                    
                }
                Spacer()
                Button
                {
                    print("tapped")
                } label: {
                    WeatherButtonView(
                        title: "Change Day Time",
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

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack() {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                
        }
    }
}
struct WeatherWeekendView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack() {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(Color("Accent7"))
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
                
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
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


