//
//  BackgroundView.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/12/25.
//


import SwiftUI

struct BackgroundView: View {
    
    var isDayTime: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            isDayTime ? Color("Accent4") : Color("Accent2"),
            isDayTime ? Color("Accent1") : Color("Accent5")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView(isDayTime: true)
}
