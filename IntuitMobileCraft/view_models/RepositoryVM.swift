//
//  RepositoryVM.swift
//  IntuitMobileCraft
//
//  Created by Andy Stechishin on 2020-02-18.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import Foundation

class RepositoryVM: ObservableObject, Identifiable {
    let id: Int
    var name: String
    var longDescription: String
    var language: String?
    var watchers: Int
    var lastIssueUpdate: Date?
    
    @Published var allIssues = [IssueVM]()
    
    @Published var openIssues = [IssueVM]()
    
    @Published var closedIssues = [IssueVM]()
    
    init(from api: GithubAPI.Repository) {
        self.id = api.id
        self.name = api.name
        self.longDescription = api.description
        self.language = api.language
        self.watchers = api.watchers
    }
    
    public func processIssue(_ newIssue: IssueVM) {
        if var existingIssue = allIssues.first(where: { $0.id == newIssue.id }) {
            if existingIssue.isOpen != newIssue.isOpen {
                if existingIssue.isOpen {
                    closedIssues.append(newIssue)
                    openIssues.removeAll(where: { $0.id == newIssue.id})
                } else {
                    openIssues.append(newIssue)
                    closedIssues.removeAll(where: { $0.id == newIssue.id})
                }
                existingIssue.isOpen = newIssue.isOpen
            }
        } else {
            allIssues.append(newIssue)
            if newIssue.isOpen {
                openIssues.append(newIssue)
            } else {
                closedIssues.append(newIssue)
            }
        }
    }
}

#if DEBUG
extension RepositoryVM {
    static let example1 = RepositoryVM(from: GithubAPI.Repository.example1)
    static let example2 = RepositoryVM(from: GithubAPI.Repository.example2)
    static let example3 = RepositoryVM(from: GithubAPI.Repository.example3)
}
#endif
