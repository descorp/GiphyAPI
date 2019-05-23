//
//  FundaRequestBuilderTests.swift
//  FundaApiTests
//
//  Created by Vladimir Abramichev on 20/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import Foundation

import XCTest

import ApiProvider
@testable import GiphyAPI

class GiphyRequestBuilderTests: XCTestCase {

    let configuration = Configuration(dictionary: ["Url":"base.giphy.url", "AppKey":"SOME_KEY", "Version": "v5"])

    func testBuildHuurRequest() {
        let sut = GiphyRequestBuilder(with: configuration)
        let request = sut.buildRequest(for: Endpoint.tranding())
        XCTAssertNotNil(request)
        XCTAssertEqual(request?.url?.absoluteString, "base.giphy.url/v5/gifs/trending?api_key=SOME_KEY")
    }

    func testBuildKoopRequest() {
        let sut = GiphyRequestBuilder(with: configuration)
        let request = sut.buildRequest(for: Endpoint.tranding(limit: 42, offset: 2, rating: .ratedPG))
        XCTAssertNotNil(request)
        XCTAssertEqual(request?.url?.absoluteString, "base.giphy.url/v5/gifs/trending?limit=42&offset=2&rating=pg&api_key=SOME_KEY")
    }
    
}
