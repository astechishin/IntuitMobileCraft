//
//  APIRepositoryTest.swift
//  IntuitMobileCraftTests
//
//  Created by Andy Stechishin on 2020-02-18.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import XCTest
@testable import IntuitMobileCraft

class APIRepositoryTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParseItem() {
        let testFile = "repo"
        if let repo: GithubAPI.Repository = parseJSON(from: testFile) {
            XCTAssertNotNil(repo.name, "Did not read Item")
            XCTAssert(repo.name == "heirloom", "Incorrect value of \(repo.name) for name")
            print(repo.owner.avatarUrl)
        }
    }

    func testParseFullList() {
        let testFile = "repo-list"
        if let repos: [GithubAPI.Repository] = parseJSON(from: testFile) {
            XCTAssertNotNil(repos, "Did not read Item")
            XCTAssert(repos.count == 30, "Repository list count is: \(repos.count)")
            XCTAssert(repos[0].name == "heirloom", "Incorrect value of \(repos[0].name) for name")
            print(repos[0].owner.avatarUrl)
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
