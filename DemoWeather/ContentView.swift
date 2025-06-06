//
//  ContentView.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/6/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isDayTime: Bool = true
    
    var body: some View {
        ZStack {
            BackgroundView(isDayTime: $isDayTime)
                
            VStack {
                CityTextView(cityName: "Atlanta, GA")
                CurrentWeatherView(
                    imageName: isDayTime ? "cloud.sun.fill" :
                        "cloud.moon.fill",
                    temperature: 76)
                
                HStack(spacing: 10) {
                    WeatherDayView(
                        dayOfWeek: "MON",
                        imageName: isDayTime ? "cloud.rain.fill" :
                            "cloud.moon.rain.fill",
                        temperature: 74)
                    WeatherDayView(
                        dayOfWeek: "TUE",
                        imageName: isDayTime ? "cloud.sun.fill" :
                            "cloud.moon.fill",
                        temperature: 75)
                    WeatherDayView(
                        dayOfWeek: "WED",
                        imageName: "tornado",
                        temperature: 90)
                    WeatherDayView(
                        dayOfWeek: "THR",
                        imageName: isDayTime ? "sun.max.fill" : "moon.fill",
                        temperature: 78)
                    WeatherDayView(
                        dayOfWeek: "FRI",
                        imageName: isDayTime ? "sun.max.fill" : "moon.fill",
                        temperature: 79)
                    WeatherWeekendView(
                        dayOfWeek: "SAT",
                        imageName: "cloud.hail.fill",
                        temperature: 80)
                    WeatherWeekendView(
                        dayOfWeek: "SUN",
                        imageName: isDayTime ? "cloud.sun.fill" :
                            "cloud.moon.fill",
                        temperature: 70)
                    
                }
                Spacer()
                Button
                {
                    isDayTime.toggle()
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
    
    @Binding var isDayTime: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            isDayTime ? Color("Accent4") : Color("Accent2"),
            isDayTime ? Color("Accent1") : Color("Accent5")]),
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


