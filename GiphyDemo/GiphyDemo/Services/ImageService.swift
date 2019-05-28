//
//  ImageLoader.swift
//  InCinema
//
//  Created by Vladimir Abramichev on 25/10/2018.
//  Copyright © 2018 Vladimir Abramichev. All rights reserved.
//

import UIKit
import ApiProvider

protocol HasImageService {
    var imageService: ImageService { get }
}

enum ImageLoaderError: Error {
    case emptyPath
}

protocol ImageService {
    func load(path: String, than handler: @escaping (Result<UIImage>) -> Void)
}

class ImageChache: ImageService {    
    typealias Dependency = HasImageLoader

    private let imageLoader: ImageLoader
    private let cache: NSCache<NSString, UIImage>

    init(dependency: Dependency, cacheLimit: Int = 100) {
        self.cache = NSCache<NSString, UIImage>()
        self.cache.countLimit = cacheLimit
        self.imageLoader = dependency.imageLoader
    }

    func load(path: String, than handler: @escaping (Result<UIImage>) -> Void) {
        if let image = cache.object(forKey: path as NSString) {
            handler(.success(image))
            return
        }

        self.imageLoader.loadImage(path: path) { [weak self] result in
            switch result {
            case .success(let data):
                guard
                    let image = path.hasSuffix("gif") ? UIImage.gif(data: data) : UIImage(data: data)
                else {
                    handler(.failure(ApiProviderError.invalidImage));
                    return
                }
                
                DispatchQueue.main.async {
                    self?.cache.setObject(image, forKey: path as NSString, cost: data.count)
                    handler(.success(image))
                }
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
