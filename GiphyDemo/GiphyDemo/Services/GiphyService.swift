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
    func getTranding(limit: Int, page: Int, than handler: @escaping (Result<PaginableData<Gif>>) -> Void)
    func getBy(id: Int, than handler: @escaping (Result<Gif>) -> Void)
}

struct PaginableData<T> {
    let total: Int
    let offset: Int
    let data: [T]
}

class GiphyService : ImageLoader, DataProvider {
    
    private let api: ApiProvider
    
    init(requestBuilder: RequestBuilder) {
        api = RemoteApiProvider(with: requestBuilder)
    }
    
    func loadImage(path: String, than handler: @escaping (Result<Data>) -> Void) {
        guard let url = URL(string: path) else {
            handler(.failure(ApiProviderError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let data = data { handler(.success(data)); return }
            if let error = error { handler(.failure(error)); return }
            
            handler(.failure(ApiProviderError.internalError))
        }.resume()
    }
    
    func getTranding(limit: Int, page: Int, than handler: @escaping (Result<PaginableData<Gif>>) -> Void) {
        api.request(Endpoint.tranding(limit: limit, offset: limit * page)) { result in
            switch result {
            case .failure(let error):
                handler(.failure(error))
            case .success(let response):
                let paginable = PaginableData(total: response.pagination?.totalCount ?? Int.max,
                                              offset: response.pagination?.offset ?? 0,
                                              data: response.data)
                handler(.success(paginable))
            }
        }
    }
    
    func getBy(id: Int, than handler: @escaping (Result<Gif>) -> Void) {
        
    }
}
