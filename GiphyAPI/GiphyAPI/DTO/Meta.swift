//
//  Meta.swift
//  GiphyAPI
//
//  Created by Vladimir Abramichev on 22/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation

// MARK: - Meta
struct Meta: Codable {
    let status: Int
    let msg, responseID: String
    
    enum CodingKeys: String, CodingKey {
        case status, msg
        case responseID = "response_id"
    }
}

// MARK: - Analytics
public struct Analytics: Codable {
    let onload, onclick, onsent: Onclick
}

// MARK: - Onclick
public struct Onclick: Codable {
    let url: String
}
