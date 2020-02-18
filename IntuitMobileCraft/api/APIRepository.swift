//
//  APIRepository.swift
//  IntuitMobileCraft
//
//  Created by Andy Stechishin on 2020-02-17.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import Foundation

extension GithubAPI {
    struct Repository: Decodable {
        struct Owner: Decodable {
            let id: Int
            let avatarUrl: URL
        }
        
        let id: Int
        let url: URL
        let name: String
        let description: String
        let updatedAt: Date
        let language: String?
        let watchers: Int
        let owner: Owner
    }

}

#if DEBUG
extension GithubAPI.Repository {
    static let example1: GithubAPI.Repository = Bundle.main.json_loader("repo1.json")
    
    static let example2: GithubAPI.Repository = Bundle.main.json_loader("repo2.json")

    static let example3: GithubAPI.Repository = Bundle.main.json_loader("repo3.json")
}
#endif
