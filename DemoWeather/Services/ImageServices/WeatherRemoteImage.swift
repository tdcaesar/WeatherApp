//
//  WeatherRemoteImage.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/13/25.
//

import SwiftUI

struct WeatherRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(fromURLString: urlString) }
    }
}

#Preview {
    WeatherRemoteImage(urlString: "https://api.weather.gov/icons/land/day/bkn?size=medium")
}
