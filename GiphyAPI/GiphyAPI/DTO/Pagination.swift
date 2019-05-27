//
//  Pagination.swift
//  GiphyAPI
//
//  Created by Vladimir Abramichev on 22/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation

// MARK: - Pagination
public struct Pagination: Codable {
    public let totalCount, count, offset: Int
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case count, offset
    }
}
