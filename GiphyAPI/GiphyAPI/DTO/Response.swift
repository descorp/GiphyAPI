//
//  Giphy.swift
//  GiphyAPI
//
//  Created by Vladimir Abramichev on 22/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation

// MARK: - Giphy
public struct Response<T: Codable>: Codable {
    public let data: T
    public let pagination: Pagination?
    public let meta: Meta
}
