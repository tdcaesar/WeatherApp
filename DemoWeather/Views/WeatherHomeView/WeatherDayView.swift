//
//  WeatherDayView.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/12/25.
//

import SwiftUI

struct WeatherDayView: View {
    
    @Binding var isDayTime: Bool
    @Binding var forecastDay : NoaaForecast.NoaaDailyWeather
        
    var body: some View {
        let day: Date = getDate(dateString: forecastDay.startTime)//(String: forecastDay.startTime)
        let dayName : String = getDay(date: day)
        let isWeekend: Bool = if dayName == "Sat" || dayName == "Sun" { true } else { false }
        let imageName: String = "cloud.fill"//forecastDay.weather.ImageName(isDayTime)

        VStack() {
            Text(dayName)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(isWeekend ? Color("Accent7") : .white)
            WeatherRemoteImage(urlString: forecastDay.icon)
                .symbolRenderingMode(.multicolor)
                //.renderingMode(.original)
                //.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text(forecastDay.temperature.description)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
    func getDate(dateString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from:dateString)!
        return date
    }
    func getDay(date:Date) -> String {
        let dayFormatter = DateFormatter()
        dayFormatter.locale = Locale(identifier: "en_US")
        dayFormatter.setLocalizedDateFormatFromTemplate("EEE")
        return dayFormatter.string(from: date)
    }
}

#Preview {
    @Previewable @State var daytime: Bool = true
    @Previewable @State var forecastDay = MockNoaaData.previewNoaaForecast.properties.periods[0]
    WeatherDayView(isDayTime: $daytime, forecastDay: $forecastDay)
        .background(Color("Accent4"))
//    WeatherDayView(isDayTime: $daytime, forecastDay: MockData.UnknownWeather)
//        .background(.gray)
}
