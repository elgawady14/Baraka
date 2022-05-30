//
//  NewsFeedViewModelTests.swift
//  BarakaTests
//
//  Created by Ahmed Abduljawad on 29/05/2022.
//

import XCTest
@testable import Baraka

class NewsFeedViewModelTests: XCTestCase {
    
    var sub = NewsFeedViewModel()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testStockTickersIsNotEmpty() throws {
        XCTAssertTrue(!sub.stockTickers.isEmpty)
    }
    
    func testStockTickersCount() throws {
        XCTAssertTrue(sub.stockTickers.count == TestConstants.StockTickersCount)
    }
    
    func testPopularNewsFeedIsNotEmpty() throws {
        XCTAssertTrue(!sub.popularNewsFeed.isEmpty)
    }
    
    func testPopularNewsFeedCount() throws {
        XCTAssertTrue(sub.popularNewsFeed.count == TestConstants.PopularNewsFeedCount)
    }
    
    func testRemindedNewsFeedIsNotEmpty() throws {
        XCTAssertTrue(!sub.remindedNewsFeed.isEmpty)
    }
    
    func testRemindedNewsFeedCount() throws {
        XCTAssertTrue(sub.remindedNewsFeed.count == TestConstants.RemindedNewsFeed)
    }
    
    func testTimerVariableIsNotNil() throws {
        // when
        sub.startTimer()
        // then
        XCTAssertTrue(sub.timer != nil)
    }
    
    func testIsLoadingNewPricesDefaultValue() throws {
        XCTAssertTrue(sub.isLoadingNewPrices.value == false)
    }
    
    func testLoadNewPrices() throws {
        // given
        sub.isLoadingNewPrices.value = false
        // when
        sub.loadNewPrices()
        // then
        XCTAssertTrue(sub.isLoadingNewPrices.value == true)
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
