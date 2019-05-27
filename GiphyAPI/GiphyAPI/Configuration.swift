//
//  Configuration.swift
//  GiphyAPI
//
//  Created by Vladimir Abramichev on 22/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation
import ApiProvider

public protocol GiphyConfiguration {
    var appKey: String { get }
    var url: String { get }
    var version: String { get }
}

extension Configuration: GiphyConfiguration {
    public var appKey: String {
        set { config["AppKey"] = newValue }
        get { return config["AppKey"] as! String }
    }
    
    public var url: String {
        set { config["Url"] = newValue }
        get { return config["Url"] as! String }
    }
    
    public var version: String {
        set { config["Version"] = newValue }
        get { return config["Version"] as! String }
    }
}
