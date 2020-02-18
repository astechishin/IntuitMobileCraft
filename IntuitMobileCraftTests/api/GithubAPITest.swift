//
//  GithubAPITest.swift
//  IntuitMobileCraftTests
//
//  Created by Andy Stechishin on 2020-02-17.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import XCTest
@testable import IntuitMobileCraft

class GithubAPITest: XCTestCase {

    let api = GithubAPI(organizationName: "intuit")
    
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRetrieveRepositoryList() throws {
        api.retrieveRepositoryList() { result in
            switch result {
            case .failure(let error):
                XCTFail("Retrieve failed with error: \(error.localizedDescription)")
            case .success(let repos):
                XCTAssert(repos.count > 0, "Expected to recieve more than 0 repository items")
            }
        }
    }
    
    func testRetrieveIssueListWithNoTime() throws {
        let repo = "simple_deploy"
        api.retrieveIssueList(for: repo) { result in
            switch result {
            case .failure(let error):
                XCTFail("Retrieve failed with error: \(error.localizedDescription)")
            case .success(let issues):
                XCTAssert(issues.count > 0, "Expected to receive more than 0 issues for \(repo)")
            }
        }
    }

    func testRetrieveIssueListSinceTime() throws {
        let repo = "simple_deploy"
        api.retrieveIssueList(for: repo) { result in
            switch result {
            case .failure(let error):
                XCTFail("Retrieve failed with error: \(error.localizedDescription)")
            case .success(let issues):
                XCTAssert(issues.count > 0, "Expected to receive more than 0 issues for \(repo)")
            }
        }
    }

    func testPerformanceExample() throws {
        try XCTSkipIf(true, "Leave for integration tests")
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
