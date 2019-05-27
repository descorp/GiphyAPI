//
//  User.swift
//  GiphyAPI
//
//  Created by Vladimir Abramichev on 22/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation

// MARK: - User
public struct User: Codable {
    public let avatarURL, bannerURL: String
    public let profileURL: String
    public let username, displayName: String
    public let isVerified: Bool
    public let bannerImage: String?
    
    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case bannerURL = "banner_url"
        case profileURL = "profile_url"
        case username
        case displayName = "display_name"
        case isVerified = "is_verified"
        case bannerImage = "banner_image"
    }
}
