//
//  Random.swift
//  GiphyAPI
//
//  Created by Vladimir Abramichev on 28/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import ApiProvider

public extension Endpoint where T == Response<Gif> {
    
    static func random(tag: String? = nil, rating: Rating? = nil) -> Endpoint {
        var query = [URLQueryItem]()
        
        if let tag = tag {
            query.append(URLQueryItem(name: "tag", value: "\(tag)"))
        }

        if let rating = rating {
            query.append(URLQueryItem(name: "rating", value: rating.rawValue))
        }
        
        return Endpoint(path: "gifs/random",
                        body: nil,
                        queryItems: query,
                        parse: T.decode)
    }
}
