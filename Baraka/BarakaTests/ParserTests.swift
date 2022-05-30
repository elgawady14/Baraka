//
//  ParserTests.swift
//  BarakaTests
//
//  Created by Ahmed Abduljawad on 30/05/2022.
//

import XCTest
@testable import Baraka

class ParserTests: XCTestCase {

    func testConvertCSVString() {
        // given
        let name = Constants.StockTickersFileName
        let type = Constants.StockTickersFileType
        // when
        guard let csvString = Parser.readDataFromFile(name: name, type: type) else {
            XCTAssert(true, "Error in reading the CSV file!")
            return
        }
        // then
        XCTAssertTrue(!Parser.convertCSVString(toDictionary: csvString).isEmpty)
    }
    
    func testReadDataFromFile() {
        // given
        let name = Constants.StockTickersFileName
        let type = Constants.StockTickersFileType
        // when
        let result = Parser.readDataFromFile(name: name, type: type)
        // then
        XCTAssertTrue(result != nil)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
