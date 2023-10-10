//
//  ImageDownloader.swift
//  FakeStore
//
//  Created by Vlad Boguzh on 07-10-2023.
//

import SwiftUI

/// Object responsible for working with images downloaded from the network
protocol ImageDownloader {
    /// Downloads image from the given URL.
    /// The image is loading from the cache if it was previously downloaded.
    /// - Parameter url: URL source of an image
    /// - Returns: The Image object received from the URL
    func loadImage(from url: String) async throws -> Image
}

final class DefaultImageDownloader: ImageDownloader {
    
    private let networkManager: NetworkManager
    private let imageCache: ImageCache
    
    init(networkManager: NetworkManager, imageCache: ImageCache) {
        self.networkManager = networkManager
        self.imageCache = imageCache
    }
    
    // MARK: ImageDownloader
    func loadImage(from url: String) async throws -> Image {
        if let uiImage = imageCache.load(forKey: url) {
            return Image(uiImage: uiImage)
        }
        let data = try await networkManager.send(url)
        guard let uiImage = UIImage(data: data) else {
            throw NetworkError.badImage
        }
        imageCache.save(image: uiImage, forKey: url)
        return Image(uiImage: uiImage)
    }
}
