//
//  ServiceValidationTests.swift
//  SystemTestTests
//
//  Created by apple on 09/06/22.
//

import XCTest
@testable import SystemTest


class ServiceValidationTests: XCTestCase {
    
    var viewModel: AcronymViewModel?
    
    override func setUp() {
        viewModel = AcronymViewModel()
    }
    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }
    
    func testDataWithWrongURL() {
        // create the expectation
        let exp = expectation(description: "Loading")
        NetWorkManager.shared.initiateServiceCall("https://google.com", "", GET_REQUEST, nil) { data , error in
            exp.fulfill()
            XCTAssertNotNil(error)
            XCTAssertNil(data, "data not found")
        }
        waitForExpectations(timeout: 10)

    }
    
    func testDataWithCorrectURL() {
        // create the expectation
        let exp = expectation(description: "Loading")

        NetWorkManager.shared.initiateServiceCall(SERVICE_BASE_URL, "", GET_REQUEST, nil) { data , error in
            exp.fulfill()

            XCTAssertNotNil(data)
            XCTAssertNil(error, "Not Error")
        }
        waitForExpectations(timeout: 10)
    }
 }
