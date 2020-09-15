//
//  SKYRequestTest.swift
//  SkyengTests
//
//  Created by Kirill Shalankin on 15.09.2020.
//  Copyright © 2020 Kirill Shalankin. All rights reserved.
//

import XCTest
@testable import Skyeng


class SKYRequestTest: XCTestCase {
    
    var searchInteractor: SKYSearchInteractor!
    

    override func setUp() {
      super.setUp()
      searchInteractor = SKYSearchInteractor()
    }

    override func tearDown() {
      searchInteractor = nil
      super.tearDown()
    }
    
    func testMakeRequest() {
        // given
        let searchableString = "Test"
        
        let promise = expectation(description: "Expecting a JSON data not nil")
      
      // when
        searchInteractor.apiManager.makeRequest(type: RequestItemsType.search,
                                                params: ["search": searchableString]) {
            (res: Swift.Result<[APIResponse.SKYWord], AlertMessage>) in
            switch res {
            case .success(let words):
                // then
                XCTAssertNotNil(words)
                promise.fulfill()
                break
            case .failure(let message):
                // then
                XCTAssertNil(message)
                break
            }
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }

}
