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
            LinearGradient(gradient: Gradient(colors: [Color("Accent5"), Color("Accent1")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Atlanta, GA")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 2) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("76°")
                        .font(.system(size: 70, weight: .medium, design: .default))
                        .foregroundColor(.white)
                }
                .padding(.bottom, 40)
                
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
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(Color("Accent9"))
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
                        .foregroundColor(.white)
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
