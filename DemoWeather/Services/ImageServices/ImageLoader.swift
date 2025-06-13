//
//  ImageLoader.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/13/25.
//


import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String) {
        ImageService.shared.downloadImage(urlString: urlString) { uiImage in
            guard let uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}
