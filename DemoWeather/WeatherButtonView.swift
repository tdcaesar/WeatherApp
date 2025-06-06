//
//  WeatherButtonView.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/6/25.
//


import SwiftUI

struct WeatherButtonView: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        
        Text(title)
            .frame(width: 280, height: 50)
            .background(Color(backgroundColor))
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
            .foregroundColor(textColor)
    }
}