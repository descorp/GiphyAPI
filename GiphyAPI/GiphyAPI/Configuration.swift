//
//  Configuration.swift
//  GiphyAPI
//
//  Created by Vladimir Abramichev on 22/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation
import ApiProvider

extension Configuration {
    var appKey: String {
        set { config["AppKey"] = newValue }
        get { return config["AppKey"] as! String }
    }
    
    var url: String {
        set { config["Url"] = newValue }
        get { return config["Url"] as! String }
    }
    
    var version: String {
        set { config["Version"] = newValue }
        get { return config["Version"] as! String }
    }
}
