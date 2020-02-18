//
//  RespositoryListView.swift
//  IntuitMobileCraft
//
//  Created by Andy Stechishin on 2020-02-18.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import SwiftUI

struct RespositoryListView: View {
    @EnvironmentObject var dataMgr: DataManager

    var body: some View {
        List {
            ForEach(dataMgr.respositories) { repo in
                NavigationLink(
                    destination: IssueTabView(repository: repo)
                ) {
                    RepositoryRowView(organizationName: self.dataMgr.organization,
                                      repo: repo)
                }
            }
        }
    }
}

struct RespositoryListView_Previews: PreviewProvider {
    static var previews: some View {
        let dm = DataManager(for: "test", usingProvider: ExampleDataProvider())

        return RespositoryListView().environmentObject(dm)
    }
}
