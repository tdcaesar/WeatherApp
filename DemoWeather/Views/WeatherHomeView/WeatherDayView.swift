//
//  WeatherDayView.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/12/25.
//

import SwiftUI

struct WeatherDayView: View {
    
    @Binding var isDayTime: Bool
    var forecastDay : WeatherDay
        
    var body: some View {
        let dayName : String = forecastDay.day.rawValue
        let isWeekend: Bool = IsWeekend(day: forecastDay.day)
        let imageName: String = forecastDay.weather.ImageName(isDayTime)

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
            Text(forecastDay.temperatureText)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    @Previewable @State var daytime: Bool = true
    WeatherDayView(isDayTime: $daytime, forecastDay: MockData.TodayWeather)
        .background(Color("Accent4"))
    WeatherDayView(isDayTime: $daytime, forecastDay: MockData.UnknownWeather)
        .background(.gray)
}
