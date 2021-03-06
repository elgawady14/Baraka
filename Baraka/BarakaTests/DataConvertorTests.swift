//
//  DataConvertorTests.swift
//  BarakaTests
//
//  Created by Ahmed Abduljawad on 29/05/2022.
//

import XCTest
@testable import Baraka
class DataConvertorTests: XCTestCase {

    override func setUpWithError() throws {}

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchStockTickers() {
        XCTAssertTrue(!DataConvertor.fetchStockTickers().isEmpty)
    }
    
    func testFetchNewsFeed() {
        XCTAssertTrue(DataConvertor.fetchNewsFeed() != nil)
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
