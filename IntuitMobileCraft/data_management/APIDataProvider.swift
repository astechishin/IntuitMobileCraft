//
//  APIDataProvider.swift
//  IntuitMobileCraft
//
//  Created by Andy Stechishin on 2020-02-18.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import Foundation

class APIDataProvider: DataProvider {
    func repositoryList(for organization: String, completion: @escaping (Result<[RepositoryVM], APIError>) -> Void) {
        let api = GithubAPI(organizationName: organization)
        
        api.retrieveRepositoryList() { result in
            switch result {
            case .success(let repoList):
                let viewRepos = repoList.map() { RepositoryVM(from: $0) }
                print("retrieved \(viewRepos.count) repos from API")
                completion(.success(viewRepos))
            case .failure(let error):
                print("Error retrieving: \(error.localizedDescription)")
                completion(.failure(error))
             }
        }
    }
    
    func issuesFor(_ repository: String, in organization: String, completion: @escaping (Result<[IssueVM], APIError>) -> Void) {
        let api = GithubAPI(organizationName: organization)

        api.retrieveIssueList(for: repository) { result in
            switch result {
            case .success(let issues):
                let viewIssues = issues.map() { IssueVM(from: $0) }
                completion(.success(viewIssues))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

#if DEBUG
class ExampleDataProvider: DataProvider {
    func repositoryList(for organization: String, completion: @escaping (Result<[RepositoryVM], APIError>) -> Void) {
        let repoList = [RepositoryVM.example1, RepositoryVM.example2, RepositoryVM.example3]
        
        completion(.success(repoList))
    }
    
    func issuesFor(_ repository: String, in organization: String, completion: @escaping (Result<[IssueVM], APIError>) -> Void) {
        let rawIssues: [GithubAPI.Issue] = Bundle.main.json_loader("issue-list.json")
        let issues = rawIssues.map() { IssueVM(from: $0) }
        completion(.success(issues))
    }
}
#endif
