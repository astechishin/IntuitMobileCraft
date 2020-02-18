//
//  APIIssue.swift
//  IntuitMobileCraft
//
//  Created by Andy Stechishin on 2020-02-17.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import Foundation

extension GithubAPI {
    struct Issue: Decodable {
        struct Label: Decodable {
            let name: String
            let color: String
        }
        
        struct User: Decodable {
            let login: String
        }
        
        let id: Int
        let number: Int
        let title: String
        let state: String
        let user: User
        let createdAt: Date
        let updatedAt: Date
        let labels: [Label]
    }
}

#if DEBUG
extension GithubAPI.Issue {
    static let example1: GithubAPI.Issue = Bundle.main.json_loader("issue1.json")
    static let example2: GithubAPI.Issue = Bundle.main.json_loader("issue2.json")
    static let example_list: [GithubAPI.Issue] = Bundle.main.json_loader("issue-list.json")
}
#endif
