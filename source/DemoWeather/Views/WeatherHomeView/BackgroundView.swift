//
//  BackgroundView.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/12/25.
//


import SwiftUI

struct BackgroundView: View {
    
    @Binding var isDayTime: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [
            isDayTime ? Color(.accent4) : Color(.accent2),
            isDayTime ? Color(.accent1) : Color(.accent5)]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView(isDayTime: .constant(true))
}
