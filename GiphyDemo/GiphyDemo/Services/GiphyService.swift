//
//  GiphyService.swift
//  GiphyDemo
//
//  Created by Vladimir Abramichev on 26/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation
import ApiProvider
import GiphyAPI

protocol ImageLoader {
    func loadImage(path: String, than handler: @escaping (Result<Data>) -> Void)
}

protocol DataProvider {
    func getTranding(limit: Int, page: Int, than handler: @escaping (Result<[Gif]>) -> Void)
    func getBy(id: Int, than handler: @escaping (Result<Gif>) -> Void)
}

class GiphyService : ImageLoader, DataProvider {
    
    private let api: ApiProvider
    
    init(requestBuilder: RequestBuilder) {
        api = RemoteApiProvider(with: requestBuilder)
    }
    
    func loadImage(path: String, than handler: @escaping (Result<Data>) -> Void) {
        
    }
    
    func getTranding(limit: Int, page: Int, than handler: @escaping (Result<[Gif]>) -> Void) {
        
    }
    
    func getBy(id: Int, than handler: @escaping (Result<Gif>) -> Void) {
        
    }
}
