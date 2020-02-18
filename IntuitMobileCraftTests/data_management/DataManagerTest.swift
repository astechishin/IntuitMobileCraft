//
//  DataManagerTest.swift
//  IntuitMobileCraftTests
//
//  Created by Andy Stechishin on 2020-02-18.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import XCTest
@testable import IntuitMobileCraft

class DataManagerTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialization() throws {
        let dm = DataManager(for: "test", usingProvider: ExampleDataProvider())
        XCTAssert(dm.respositories.count == 3, "Expected 3 repositories to be loaded got: \(dm.respositories.count)")
    }
    
    func testInitializationWithAPI() throws {
        try XCTSkipIf(true, "Need to set up expectation for completion within DataManager")
        let dm = DataManager(for: "intuit", usingProvider: APIDataProvider())
        XCTAssert(dm.respositories.count > 0, "Expected more than 0 repositories to be loaded")
    }

    func testPerformanceExample() throws {
        try XCTSkipIf(true)
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
