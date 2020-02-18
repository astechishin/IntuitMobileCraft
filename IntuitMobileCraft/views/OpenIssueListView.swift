//
//  OpenIssueListView.swift
//  IntuitMobileCraft
//
//  Created by Andy Stechishin on 2020-02-18.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import SwiftUI

struct OpenIssueListView: View {
    @ObservedObject var repository: RepositoryVM
    
    var body: some View {
        List(repository.openIssues) { issue in
            IssueRowView(issue: issue)
        }
    }
}

struct IssueListView_Previews: PreviewProvider {
    static var previews: some View {
        return OpenIssueListView(repository: RepositoryVM.example1)
    }
}
