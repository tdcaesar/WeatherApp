//
//  RemoteImage.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/13/25.
//


import SwiftUI

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("sun.fill").resizable()
    }
}

//#Preview {
//    RemoteImage()
//}
