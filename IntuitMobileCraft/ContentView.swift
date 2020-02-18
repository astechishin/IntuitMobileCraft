//
//  ContentView.swift
//  IntuitMobileCraft
//
//  Created by Andy Stechishin on 2020-02-14.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import SwiftUI

private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .medium
    return dateFormatter
}()

struct ContentView: View {
    @EnvironmentObject var dataMgr: DataManager
 
    var body: some View {
        NavigationView {
            RespositoryListView()
                .navigationBarTitle(Text(dataMgr.organization))
                .navigationBarItems(
                    trailing: Button(
                        action: {
                            withAnimation { self.initiateRefresh() }
                        }
                    ) {
                        Image(systemName: "arrow.clockwise")
                    }
                )
            Text("Select a repository to view the issues")
                .navigationBarTitle(Text("Issue List"))
        }.navigationViewStyle(DoubleColumnNavigationViewStyle())
    }
    
    func initiateRefresh() {
        print("refresh initiated...go do it!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let dm = DataManager(for: "test", usingProvider: ExampleDataProvider())
        
        return ContentView().environmentObject(dm)
    }
}
