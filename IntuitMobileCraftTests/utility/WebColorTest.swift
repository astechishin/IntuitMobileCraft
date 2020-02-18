//
//  WebColorTest.swift
//  IntuitMobileCraftTests
//
//  Created by Andy Stechishin on 2020-02-18.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import XCTest
@testable import IntuitMobileCraft

class WebColorTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialization() throws {
        var test = WebColor("202020")
        XCTAssert(test.red == 32, "Red should equal 32 not \(test.red)")
        test = WebColor("011020")
        XCTAssert(test.red == 1, "Red should equal 1 not \(test.red)")
        XCTAssert(test.green == 16, "Green should equal 16 not \(test.green)")
        XCTAssert(test.blue == 32, "Blue should equal 32 not \(test.blue)")
        test = WebColor("54ff2a")
        XCTAssert(test.red == 84, "Red should equal 84 not \(test.red)")
        XCTAssert(test.green == 255, "Green should equal 255 not \(test.green)")
        XCTAssert(test.blue == 42, "Blue should equal 42 not \(test.blue)")
    }
    
    func testLuminance() throws {
        var test = WebColor("ffffff")
        XCTAssert(test.highLuminance, "Should be high luminance")
        test = WebColor("041f22")
        XCTAssert(!test.highLuminance, "Should be low luminance")
    }

    func testPerformanceExample() throws {
        try XCTSkipIf(true, "Implement for integration")
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
