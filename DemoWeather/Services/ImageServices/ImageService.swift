//
//  ImageService.swift
//  DemoWeather
//
//  Created by Eric DeCesare on 6/13/25.
//

import UIKit

final class ImageService {
    static let shared = ImageService()
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func downloadImage(urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        // Pull the image from cache if available
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        // Check the URL
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        // Download the image and add to the cache if good
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()

    }
}
