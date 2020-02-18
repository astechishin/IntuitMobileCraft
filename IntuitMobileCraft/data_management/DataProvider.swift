//
//  DataProvider.swift
//  IntuitMobileCraft
//
//  Created by Andy Stechishin on 2020-02-18.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import Foundation

protocol DataProvider {
    func repositoryList(for organization: String, completion: @escaping (Result<[RepositoryVM], APIError>) -> Void)
    
    func issuesFor(_ repository: String, in organization: String,
                   completion: @escaping (Result<[IssueVM], APIError>) -> Void)
}
