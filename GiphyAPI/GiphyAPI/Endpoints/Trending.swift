//
//  Trending.swift
//  GiphyAPI
//
//  Created by Vladimir Abramichev on 22/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation
import ApiProvider

public extension Endpoint where T == Response<Gif> {
    static func tranding(limit: Int? = nil, offset: Int? = nil, rating: Rating? = nil) -> Endpoint {
        var query = [URLQueryItem]()
        
        if let limit = limit {
            query.append(URLQueryItem(name: "limit", value: "\(limit)"))
        }
        
        if let offset = offset {
            query.append(URLQueryItem(name: "offset", value: "\(offset)"))
        }
        
        if let rating = rating {
            query.append(URLQueryItem(name: "rating", value: rating.rawValue))
        }
        
        return Endpoint(path: "gifs/trending",
                        body: nil,
                        queryItems: query,
                        parse: T.decode)
    }
}
