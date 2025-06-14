//
//  LocationView.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/12/25.
//

import SwiftUI
import CoreLocationUI

struct LocationView: View {
    
    @EnvironmentObject var locationService: LocationService
    
    var body: some View {
        ZStack {
            //BackgroundView(isDayTime: .constant(true))
            
            VStack {
                Text("Welcome to the Weather App")
                    .bold()
                    .font(.title)
                    .padding()
                
                Text("Please share your current location to get weather information for your local area.")
                    .padding()
                
                Spacer()
                
                LocationButton(.shareCurrentLocation) {
                    locationService.requestLocation()
                }
                .cornerRadius(10)
                .symbolVariant(.fill)
                .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .multilineTextAlignment(.center)
            .padding()
        }
    }
}

#Preview {
    LocationView()
}
