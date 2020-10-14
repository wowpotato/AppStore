//
//  UIImageViewExtension.swift
//  appStore
//
//  Created by myslab on 2020/09/19.
//  Copyright © 2020 mys. All rights reserved.
//

import UIKit

public final class ImageCache {
    static let shared: ImageCache = ImageCache()
    private let imageCache = NSCache<NSString, UIImage>()
    
    subscript(_ key: NSString) -> UIImage? {
        return imageCache.object(forKey: key)
    }
    
    func set(_ key: NSString, _ image: UIImage) {
        imageCache.setObject(image, forKey: key)
    }
}

// MARK: - Associated Object
private var taskIdentifierKey: Void?

extension UIImageView {
    private var task: URLSessionTask? {
        get {
            objc_getAssociatedObject(self,  &taskIdentifierKey) as? URLSessionTask
        }
        set {
            objc_setAssociatedObject(self,  &taskIdentifierKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func loadImage(_ urlString : String?) {
        self.image = nil
        guard let urlString = urlString else { return }
        guard let url = URL(string: urlString) else { return }
        
        // check cached image
        if let cachedImage = ImageCache.shared[urlString as NSString]  {
            self.animate()
            self.image = cachedImage
            return
        }
        
        self.task?.cancel()
        self.task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data else { return }
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    ImageCache.shared.set(urlString as NSString, image)
                    self.animate()
                    self.image = image
                }
            }
        })
        self.task?.resume()
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
