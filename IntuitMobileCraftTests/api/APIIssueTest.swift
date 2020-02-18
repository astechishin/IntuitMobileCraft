//
//  APIIssueTest.swift
//  IntuitMobileCraftTests
//
//  Created by Andy Stechishin on 2020-02-18.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import XCTest
@testable import IntuitMobileCraft

class APIIssueTest: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParseItem() {
        let testFile = "issue"
        if let issue: GithubAPI.Issue = parseJSON(from: testFile) {
            XCTAssertNotNil(issue.title, "Did not read Item")
            XCTAssert(issue.title.contains("Heirloom allows data"), "Incorrect value of \(issue.title) for name")
            XCTAssert(issue.labels.count == 0, "Issues has \(issue.labels.count) labels expected 0")
        }
    }
    
    func testParseItemWithMultipleLabels() {
        let testFile = "issue-multi-label"
        if let issue: GithubAPI.Issue = parseJSON(from: testFile) {
            XCTAssertNotNil(issue.title, "Did not read Item")
            XCTAssert(issue.title == "The Jimmy Flag", "Incorrect value of \(issue.title) for name")
            XCTAssert(issue.labels.count == 2, "Issues has \(issue.labels.count) labels expected 2")
        }
    }

    func testPerformanceExample() throws {
        try XCTSkipIf(true)
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
