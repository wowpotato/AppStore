//
//  UIImageViewExtension.swift
//  appStore
//
//  Created by myslab on 2020/09/19.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadImage(_ urlString : String?) {
        self.image = nil
        guard let urlString = urlString else { return }
        guard let url = URL(string: urlString) else { return }
        
        // check cached image
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.animate()
            self.image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data else { return }
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.animate()
                    self.image = image
                }
            }
        }).resume()
    }
    
    func animate() {
        self.alpha = 0.6
        UIView.animate(withDuration: 0.2) {
            self.alpha = 1.0
        }
    }
    
    func setTintColorImage(_ color: UIColor) {
        self.image = self.image?.withRenderingMode(.alwaysTemplate)
        self.tintColor = color
    }
}
