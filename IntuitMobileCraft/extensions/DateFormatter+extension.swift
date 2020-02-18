//
//  DateFormatter+extension.swift
//  IntuitMobileCraft
//
//  Created by Andy Stechishin on 2020-02-17.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import Foundation

extension DateFormatter {
  public static let jsonDate: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
return formatter
  }()
}
