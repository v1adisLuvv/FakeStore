//
//  ImageCache.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 07-10-2023.
//

import UIKit

/// Object responsible for caching images
protocol ImageCache {
    /// Loads the image previously saved to the cache
    /// - Parameter key: Image URL is the key
    /// - Returns: The UIImage saved to cache or nil if it was not found
    func load(forKey key: String) -> UIImage?
    /// Saves the image to cache
    /// - Parameters:
    ///   - image: UIImage
    ///   - key: The URL of this image
    func save(image: UIImage, forKey key: String)
}

final class DefaultImageCache: ImageCache {
    
    private let cache = NSCache<NSString, UIImage>()
    
    // MARK: ImageCache
    func load(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func save(image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
}
