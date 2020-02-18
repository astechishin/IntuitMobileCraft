//
//  JsonDecoder+extension.swift
//  IntuitMobileCraft
//
//  Created by Andy Stechishin on 2020-02-17.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import Foundation

extension JSONDecoder {
    public static func apiDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.jsonDate)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
