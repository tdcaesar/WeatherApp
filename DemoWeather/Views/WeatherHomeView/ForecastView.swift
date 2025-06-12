//
//  ForecastView.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/12/25.
//


import SwiftUI

struct ForecastView: View {
    
    @Binding var isDayTime: Bool
    var Forecast: Forecast
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(Forecast.days, id: \.id) { weatherDay in
                WeatherDayView(isDayTime: $isDayTime, forecastDay: weatherDay)
            }
        }
    }
}

#Preview {
@Previewable @State var daytime: Bool = true
    ForecastView(isDayTime: $daytime, Forecast: MockData.ForecastWeek)
        .background(Color("Accent4"))
    ForecastView(isDayTime: $daytime, Forecast: MockData.UnknownForecastWeek)
        .background(.gray)
}
