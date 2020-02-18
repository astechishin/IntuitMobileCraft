//
//  XCTestCase+extension.swift
//  IntuitMobileCraftTests
//
//  Created by Andy Stechishin on 2020-02-17.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
    /// Read a JSON file into an object, used to test the Decodable implementation
    /// - Parameters:
    ///   - fileName: the name of the file (without the trailing .json) to read from
    ///   - fileBundle: the Bundle that contains the JSON file to read and parse, default is nil which indicates the file is part of the Test bundle,
    ///   use Bundle.main for main application bundle
    ///   - file: the file that invoked this method (do not specify unless calling from another convenience method)
    ///   - line: the line in the invoking method (do not specify unless calling from another convenience method)
    public func parseJSON<T: Decodable>(from fileName: String, fileBundle: Bundle? = nil,
                                        file: StaticString = #file, line: UInt = #line) -> T? {
        let bundle: Bundle
        
        if fileBundle == nil {
            bundle = Bundle(for: type(of: self))
        } else {
            bundle = fileBundle!
        }
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            XCTFail("Missing file: \(fileName).json", file: file, line: line)
            return nil
        }
        
        guard let data = try? Data(contentsOf: url) else {
            XCTFail("Unable to read from file \(fileName).json", file: file, line: line)
            return nil
        }
        
        let jsonDecoder = JSONDecoder.apiDecoder()
        //jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.jsonDate)
        //jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let localJSON = try? jsonDecoder.decode(T.self, from: data) else {
            XCTAssertNoThrow(try jsonDecoder.decode(T.self, from: data), file: file, line: line)
            return nil
        }
        return localJSON
    }
}
