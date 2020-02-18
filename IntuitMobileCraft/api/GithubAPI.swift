//
//  GithubAPI.swift
//  IntuitMobileCraft
//
//  Created by Andy Stechishin on 2020-02-17.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import Foundation

class GithubAPI: JsonApiClient {
    let githubBaseUrl = "https://api.github.com"
    let reposPath     = "repos"
    let orgsPath      = "orgs"
    let issuesPath    = "issues"
    
    let session: URLSession
    
    private let baseURL: URL
    
    private let organizationName: String

    private var activeRetrieveTask: URLSessionDataTask?

    init(organizationName: String, session: URLSession = .shared) {
        self.session = session
        self.organizationName = organizationName
        self.baseURL = URL(string: githubBaseUrl)!
    }
    
    func retrieveRepositoryList(completion: @escaping (Result<[Repository], APIError>) -> Void) {
        let url = baseURL.appendingPathComponent(orgsPath).appendingPathComponent(organizationName)
            .appendingPathComponent(reposPath)
        let request = URLRequest(url: url)

        print("retrieving using URL: \(url)")
        activeRetrieveTask?.cancel()
        activeRetrieveTask = perform(request: request, completion: parseDecodable(completion: completion))
    }
    
    func retrieveIssueList(for repo: String, since: Date?=nil, completion: @escaping (Result<[Issue], APIError>) -> Void) {
        var queryItems = [URLQueryItem]()
        let url = baseURL.appendingPathComponent(reposPath).appendingPathComponent(organizationName)
            .appendingPathComponent(repo).appendingPathComponent(issuesPath)
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        
        // Add client_id and client_secret to avoid throttling and ensure that both open and closed
        // issues are returned
        queryItems.append(URLQueryItem(name: "state", value: "all"))
        queryItems.append(URLQueryItem(name: "client_id", value: "Iv1.ecccdfd29ea3958a"))
        queryItems.append(URLQueryItem(name: "client_secret", value: "68d466288e850672dd3bc70a825fc0c6c183f7b9"))
        urlComponents.queryItems = queryItems

        let request = URLRequest(url: urlComponents.url!)

        print("retrieving using URL: \(urlComponents)")
        activeRetrieveTask?.cancel()
        activeRetrieveTask = perform(request: request, completion: parseDecodable(completion: completion))

    }
}
