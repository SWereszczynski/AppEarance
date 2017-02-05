//
//  Image.swift
//  AppEarance
//
//  Created by Szymon Wereszczynski on 31.01.2017.

import UIKit

extension UIImageView {
    
    func downloadFromUrl(url: URL) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async { () -> Void in
                self.image = image
            }
        }.resume()
    }
}
