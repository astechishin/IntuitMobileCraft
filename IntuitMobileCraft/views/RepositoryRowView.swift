//
//  RepositoryRowView.swift
//  IntuitMobileCraft
//
//  Created by Andy Stechishin on 2020-02-18.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import SwiftUI

private let numberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.roundingMode = .halfUp
    formatter.minimumFractionDigits = 1
    formatter.maximumFractionDigits = 1
    return formatter
}()

struct RepositoryRowView: View {
    let languageTypes = ["Ruby", "Objective-C", "R", "JavaScript", "Go", nil, "Java", "Swift", "Python", "C#", "PHP"]
    
    var organizationName: String
    
    var repo: RepositoryVM
    
    var watcherCount: String {
        if repo.watchers > 999 {
            let watchersInThousands = NSNumber(value: (Double(repo.watchers) / 1000.0))
            return "\(numberFormatter.string(from: watchersInThousands) ?? "0.0")k"
        } else {
            return "\(repo.watchers)"
        }
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "archivebox.fill")
                .padding(.top, 7)
            VStack(alignment: .leading, spacing: 6.0) {
                HStack(spacing: 0) {
                    Text("\(organizationName)/")
                        .padding(.trailing, 0)
                    Text(repo.name)
                        .bold()
                        .padding(.leading, 0)
                    Spacer()
                }
                .foregroundColor(Color.blue)
                
                Text(repo.longDescription)
                    .font(.subheadline)
                    .fontWeight(.light)
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.black.opacity(0.65))
                    Text(self.watcherCount)
                        .padding(.trailing, 10)
                    Image(systemName: "circle.fill")
                    Text(repo.language ?? "")
                }
            }
        }
    }
}

struct RepositoryRowView_Previews: PreviewProvider {
    static var previews: some View {
        let githubOrganization = (UIApplication.shared.delegate as! AppDelegate).defaultGithubOrganization

        return List {
            NavigationLink(destination: Text("Hello")) {
                RepositoryRowView(organizationName: githubOrganization,
                                  repo: RepositoryVM.example1)
            }
            NavigationLink(destination: Text("Hello")) {
                RepositoryRowView(organizationName: githubOrganization,
                                  repo: RepositoryVM.example3)
            }
        }
    }
}
