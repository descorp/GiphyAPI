//
//  Dependencies.swift
//  GiphyDemo
//
//  Created by Vladimir Abramichev on 26/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation

protocol HasImageLoader {
    var imageLoader: ImageLoader { get }
}

protocol HasGiphyService {
    var gifService: DataProvider { get }
}

struct AppDependency: HasImageService, HasImageLoader, HasGiphyService {
    private var container: [String:Any] = [:]
    
    var imageService: ImageService {
        return container["ImageService"] as! ImageService
    }
    
    var imageLoader: ImageLoader {
        return container["ImageLoader"] as! ImageLoader
    }
    
    var gifService: DataProvider {
        return container["GifProvider"] as! DataProvider
    }
    
    mutating func add(_ item: Any, as type: Any) {
        container[String(describing: type)] = item
    }
}
