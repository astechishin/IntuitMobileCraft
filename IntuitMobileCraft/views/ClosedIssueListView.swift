//
//  ClosedIssueListView.swift
//  IntuitMobileCraft
//
//  Created by Andy Stechishin on 2020-02-18.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import SwiftUI

struct ClosedIssueListView: View {
    @ObservedObject var repository: RepositoryVM
    
    var body: some View {
        List(repository.closedIssues) { issue in
            IssueRowView(issue: issue)
        }
    }
}

struct ClosedIssueListView_Previews: PreviewProvider {
    static var previews: some View {
        ClosedIssueListView(repository: RepositoryVM.example1)
    }
}
