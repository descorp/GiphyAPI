//
//  GiphyRequestBuilder.swift
//  GiphyAPI
//
//  Created by Vladimir Abramichev on 22/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation
import ApiProvider

public class GiphyRequestBuilder: RequestBuilder {
    
    private let config : GiphyConfiguration
    
    public init(with configuration: GiphyConfiguration) {
        self.config = configuration
    }
    
    public func buildRequest<T>(for endpoint: Endpoint<T>) -> URLRequest? {
        guard var components = URLComponents(string: config.url)
            else { preconditionFailure("invalud URL in config file") }
        
        components.appendPath(config.version)
        components.appendPath(endpoint.path)
        components.queryItems = endpoint.queryItems
        components.queryItems?.append(URLQueryItem(name: "api_key", value: config.appKey))
        
        guard let url = components.url
            else { preconditionFailure("invalud URL: \(components.description)") }
        
        return URLRequest(url: url)
    }
}

extension URLComponents {
    mutating func appendPath(_ component: String?) {
        guard let component = component else { return }
        appendPath(component.hasPrefix("/") ? "\(component.dropFirst())" : component)
    }
    
    mutating func appendPath(_ component: Int?) {
        guard let component = component else { return }
        appendPath("\(component)")
    }
    
    private mutating func appendPath(_ component: String) {
        self.path += "/" + component
    }
}

