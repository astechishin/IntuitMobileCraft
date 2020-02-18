//
//  Bundle+json_loader.swift
//  IntuitMobileCraft
//
//  Created by Andy Stechishin on 2020-02-17.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import Foundation

extension Bundle {
    func json_loader<T:Decodable>(_ filename: String, as type:T.Type = T.self) -> T {
        let data: Data
        
        guard let file = self.url(forResource: filename, withExtension: nil)
            else {
                print("File not found in load")
                fatalError("Couldn't find \(filename) in bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename):\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder.apiDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
}
