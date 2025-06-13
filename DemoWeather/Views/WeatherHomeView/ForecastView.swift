//
//  ForecastView.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/12/25.
//


import SwiftUI

struct ForecastView: View {
    
    @Binding var isDayTime: Bool
    @Binding var forecast: NoaaForecast
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach($forecast.properties.periods, id: \.number) { weatherDay in
                if weatherDay.number.wrappedValue % 2 != 0 {
                    WeatherDayView(isDayTime: $isDayTime, forecastDay: weatherDay)
                }
            }
        }
    }
}

#Preview {
@Previewable @State var daytime: Bool = true
    @Previewable @State var forecast = MockNoaaData.previewNoaaForecast
    ForecastView(isDayTime: $daytime, forecast: $forecast)
        .background(Color("Accent4"))
//    ForecastView(isDayTime: $daytime, Forecast: MockData.UnknownForecastWeek)
//        .background(.gray)
}
