//
//  Gif.swift
//  GiphyAPI
//
//  Created by Vladimir Abramichev on 22/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation

// MARK: - Datum
public struct Gif: Codable {
    public let type: TypeEnum
    public let id, slug: String
    public let url, bitlyGIFURL, bitlyURL, embedURL: String
    public let username: String
    public let source: String
    public let rating: Rating?
    public let contentURL, sourceTLD: String
    public let sourcePostURL: String
    public let isSticker: Int
    public let importDatetime, trendingDatetime: String
    public let user: User?
    public let images: Images
    public let title: String
    public let analytics: Analytics?
    
    enum CodingKeys: String, CodingKey {
        case type, id, slug, url
        case bitlyGIFURL = "bitly_gif_url"
        case bitlyURL = "bitly_url"
        case embedURL = "embed_url"
        case username, source, rating
        case contentURL = "content_url"
        case sourceTLD = "source_tld"
        case sourcePostURL = "source_post_url"
        case isSticker = "is_sticker"
        case importDatetime = "import_datetime"
        case trendingDatetime = "trending_datetime"
        case user, images, title, analytics
    }
}

// MARK: - Images
public struct Images: Codable {
    public let fixedHeightStill, originalStill: The480_WStill
    public let fixedWidth: FixedHeight
    public let fixedHeightSmallStill: The480_WStill
    public let fixedHeightDownsampled: FixedHeight
    public let preview: DownsizedSmall
    public let fixedHeightSmall: FixedHeight
    public let downsizedStill, downsized, downsizedLarge, fixedWidthSmallStill: The480_WStill
    public let previewWebp: The480_WStill?
    public let fixedWidthStill: The480_WStill
    public let fixedWidthSmall: FixedHeight
    public let downsizedSmall: DownsizedSmall
    public let fixedWidthDownsampled: FixedHeight
    public let downsizedMedium: The480_WStill
    public let original, fixedHeight: FixedHeight
    public let hd: DownsizedSmall?
    public let looping: Looping
    public let originalMp4: DownsizedSmall
    public let previewGIF, the480WStill: The480_WStill
    
    enum CodingKeys: String, CodingKey {
        case fixedHeightStill = "fixed_height_still"
        case originalStill = "original_still"
        case fixedWidth = "fixed_width"
        case fixedHeightSmallStill = "fixed_height_small_still"
        case fixedHeightDownsampled = "fixed_height_downsampled"
        case preview
        case fixedHeightSmall = "fixed_height_small"
        case downsizedStill = "downsized_still"
        case downsized
        case downsizedLarge = "downsized_large"
        case fixedWidthSmallStill = "fixed_width_small_still"
        case previewWebp = "preview_webp"
        case fixedWidthStill = "fixed_width_still"
        case fixedWidthSmall = "fixed_width_small"
        case downsizedSmall = "downsized_small"
        case fixedWidthDownsampled = "fixed_width_downsampled"
        case downsizedMedium = "downsized_medium"
        case original
        case fixedHeight = "fixed_height"
        case hd, looping
        case originalMp4 = "original_mp4"
        case previewGIF = "preview_gif"
        case the480WStill = "480w_still"
    }
}

// MARK: - The480_WStill
public struct The480_WStill: Codable {
    public let url: String
    public let width, height: String
    public let size: String?
}

// MARK: - DownsizedSmall
public struct DownsizedSmall: Codable {
    public let width, height: String
    public let mp4: String
    public let mp4Size: String
    
    enum CodingKeys: String, CodingKey {
        case width, height, mp4
        case mp4Size = "mp4_size"
    }
}

// MARK: - FixedHeight
public struct FixedHeight: Codable {
    public let url: String
    public let width, height, size: String
    public let mp4: String?
    public let mp4Size: String?
    public let webp: String
    public let webpSize: String
    public let frames, hash: String?
    
    enum CodingKeys: String, CodingKey {
        case url, width, height, size, mp4
        case mp4Size = "mp4_size"
        case webp
        case webpSize = "webp_size"
        case frames, hash
    }
}

// MARK: - Looping
public struct Looping: Codable {
    public let mp4: String
    public let mp4Size: String
    
    enum CodingKeys: String, CodingKey {
        case mp4
        case mp4Size = "mp4_size"
    }
}

public enum TypeEnum: String, Codable {
    case gif
    case sticker
}


