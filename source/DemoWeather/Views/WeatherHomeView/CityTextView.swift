//
//  CityTextView.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/12/25.
//


import SwiftUI

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

#Preview {
    CityTextView(cityName: MockData.LocationName)
        .background(Color("Accent4"))
    CityTextView(cityName: MockData.UnknownLocationName)
        .background(.gray)
}
