//
//  DataManager.swift
//  IntuitMobileCraft
//
//  Created by Andy Stechishin on 2020-02-18.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import Foundation

class DataManager: ObservableObject {
    @Published var respositories = [RepositoryVM]()
    
    let provider: DataProvider
    
    let organization: String
    
    init(for organization: String, usingProvider provider: DataProvider) {
        self.provider = provider
        self.organization = organization
        
        updateRepositories()
    }
    
    public func updateRepositories() {
        provider.repositoryList(for: organization) { result in
            switch result {
            case .success(let repositoryList):
                for repo in repositoryList {
                    if let existingRepo = self.respositories.first(where: { $0.id == repo.id }) {
                        print("\(existingRepo.name) exists")
                    } else {
                        print("Adding new repo: \(repo.name)")
                        self.respositories.append(repo)
                    }
                }
            case .failure(let error):
                print("*** Error returned from repository list update: \(error.localizedDescription)")
            }
        }
    }
    
    public func updateIssuesFor(_ repository: RepositoryVM) {
        if let repo = respositories.first(where: { $0.id == repository.id }) {
            provider.issuesFor(repo.name, in: organization) { result in
                switch result {
                case .success(let issueList):
                    // print("received \(issueList.count) issues to be processed for \(repo.name)")
                    for issue in issueList {
                        repo.processIssue(issue)
                    }
                    repo.lastIssueUpdate = Date()
                case .failure(let error):
                    print("*** Error returned from issue list update: \(error.localizedDescription)")
                }
            }
        }
    }
}
