//
//  IssueTabView.swift
//  IntuitMobileCraft
//
//  Created by Andy Stechishin on 2020-02-18.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import SwiftUI

struct IssueTabView: View {
    @EnvironmentObject var dataMgr: DataManager

    @ObservedObject var repository: RepositoryVM
    
    var body: some View {
        TabView {
            OpenIssueListView(repository: repository)
                .tabItem { Text("Open").font(.headline) }
            ClosedIssueListView(repository: repository)
                .tabItem {Text("Closed").font(.headline) }
        }.navigationBarTitle(Text(repository.name))
            .onAppear {
                //print("initiate issue load")
                self.dataMgr.updateIssuesFor(self.repository)
        }
    }
}

struct IssueTabView_Previews: PreviewProvider {
    static var previews: some View {
        let dm = DataManager(for: "test", usingProvider: ExampleDataProvider())

        return IssueTabView(repository: RepositoryVM.example1).environmentObject(dm)
    }
}
