//
//  Rating.swift
//  GiphyAPI
//
//  Created by Vladimir Abramichev on 22/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation

public enum Rating: String, Codable {
    case ratedY = "y"
    case ratedG = "g"
    case ratedPG = "pg"
    case ratedPG13 = "pg-13"
    case ratedR = "r"
    case nsfw
    case unrated
}
