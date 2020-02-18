//
//  IssueVM.swift
//  IntuitMobileCraft
//
//  Created by Andy Stechishin on 2020-02-18.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import Foundation


struct IssueVM: Identifiable {
    let id: Int
    let number: Int
    let title: String
    let author: String
    let createdAt: Date
    let updatedAt: Date
    var isOpen: Bool
    let labels: [String: String]
    
    init(from api: GithubAPI.Issue) {
        self.id = api.id
        self.number = api.number
        self.title = api.title
        self.author = api.user.login
        self.createdAt = api.createdAt
        self.updatedAt = api.updatedAt
        self.isOpen = api.state == "open" ? true : false
        
        var issue_labels = [String: String]()
        for label in api.labels {
            issue_labels[label.name] = label.color
        }
        self.labels = issue_labels
    }
}

#if DEBUG
extension IssueVM {
    static let example1 = IssueVM(from: GithubAPI.Issue.example1)
    static let example2 = IssueVM(from: GithubAPI.Issue.example2)
    static let example_list: [IssueVM] = GithubAPI.Issue.example_list.map { IssueVM(from: $0) }
}
#endif
