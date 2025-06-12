//
//  CurrentWeatherView.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/12/25.
//

import SwiftUI

struct CurrentWeatherView: View {

    @Binding var isDayTime: Bool
    var currentWeather: WeatherDay

    var body: some View {
        VStack(spacing: 2) {
            Image(systemName: currentWeather.weather.ImageName(isDayTime))
                .symbolRenderingMode(.multicolor)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text(currentWeather.temperatureText)
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

#Preview {
    @Previewable @State var daytime: Bool = true
    CurrentWeatherView(isDayTime: $daytime, currentWeather: MockData.TodayWeather)
        .background(Color("Accent4"))
    CurrentWeatherView(isDayTime: $daytime, currentWeather: MockData.UnknownWeather)
        .background(.gray)
}
