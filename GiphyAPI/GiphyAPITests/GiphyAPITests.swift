//
//  GiphyAPITests.swift
//  GiphyAPITests
//
//  Created by Vladimir Abramichev on 22/05/2019.
//  Copyright © 2019 Vladimir Abramichev. All rights reserved.
//

import XCTest
import ApiProvider
@testable import GiphyAPI

class GiphyAPITests: XCTestCase {
    
    var apiProvider: RemoteApiProvider!
    
    override func setUp() {
        let config = Configuration(bundle: Bundle(for: type(of: self)))
        let requestBuilder = GiphyRequestBuilder(with: config)
        apiProvider = RemoteApiProvider(with: requestBuilder)
    }
    
    override func tearDown() {
        apiProvider = nil
    }
    
    func testTranding() {
        let successExpectation = expectation(description: "Success")
        apiProvider.request(Endpoint.tranding(limit: 15, offset: 1, rating: .ratedG)) { result in
            if case .success(let responce) = result {
                XCTAssertNotNil(responce)
                XCTAssertNotNil(responce.data)
                XCTAssertEqual(responce.data.count, 15)
                XCTAssertEqual(responce.data[0].rating, Rating.ratedG)
            } else {
                XCTFail("Error: \(result)")
            }
            successExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testRandom() {
        let successExpectation = expectation(description: "Success")
        apiProvider.request(Endpoint.random(tag: "cat", rating: .ratedG)) { result in
            if case .success(let responce) = result {
                XCTAssertNotNil(responce)
                XCTAssertNotNil(responce.data)
                XCTAssertNotNil(responce.data.images)
            } else {
                XCTFail("Error: \(result)")
            }
            successExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
