//
//  IssueRowView.swift
//  IntuitMobileCraft
//
//  Created by Andy Stechishin on 2020-02-18.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import SwiftUI

private let dateFormatter: RelativeDateTimeFormatter = {
    let dateFormatter = RelativeDateTimeFormatter()
    dateFormatter.unitsStyle = .full
    return dateFormatter
}()

struct IssueRowView: View {
    let issue: IssueVM
    
    var when: String {
        dateFormatter.localizedString(for: issue.createdAt, relativeTo: Date())
    }
    
    var hasTags: Bool {
        issue.labels.count > 0
    }
    
    var labelKeys: [String] {
        issue.labels.map { key, _ in key }
    }
    
    var isOpen = true
    
    var body: some View {
        HStack(alignment: .top) {
            if issue.isOpen {
                Image(systemName: "exclamationmark.circle")
                    .padding(.top, 4)
            } else {
                Image(systemName: "checkmark.circle")
                    .padding(.top, 4)
            }

            VStack(alignment: .leading, spacing: 2.5) {
                Text(issue.title)
                .bold()
                    .foregroundColor(Color.blue)
               
                Text("Opened by \(issue.author)   \(self.when)")
                    .font(.subheadline)
                    .fontWeight(.light)
                    .foregroundColor(Color.black.opacity(0.8))
                
                if hasTags {
                    HStack {
                        ForEach(labelKeys, id: \.self) { label_name in
                            LabelTag(label: label_name, rgb: self.issue.labels[label_name, default: ""])
                        }
                    }.padding(.top, 4)
                }
            }
            
            Spacer()
            
            Text("#\(issue.number)")
                .padding(.top, 3.5)
                .font(.caption)
                .foregroundColor(Color.black.opacity(0.8))
        }
    }
}

struct LabelTag: View {
    var label: String
    var rgb: String
    
    var webColor: WebColor {
        WebColor(rgb)
    }
    
    var textColor: Color {
        if webColor.highLuminance {
            return Color.black
        } else {
            return Color.white
        }
    }
    
    var tagColor: Color {
        Color(webColor.uiColor)
    }
    
    var body: some View {
        Text(label)
            .font(.caption)
            .bold()
            .padding(.init(top: 1.5, leading: 5, bottom: 1.5, trailing: 5))
            .foregroundColor(textColor)
            .background(tagColor)
    }
}

struct IssueRowView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            IssueRowView(issue: IssueVM.example1)
            IssueRowView(issue: IssueVM.example2)
        }
    }
}
