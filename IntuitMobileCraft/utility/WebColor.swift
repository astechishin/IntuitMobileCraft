//
//  WebColor.swift
//  IntuitMobileCraft
//
//  Created by Andy Stechishin on 2020-02-18.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import Foundation
import UIKit

struct WebColor {
    let red: Int
    let green: Int
    let blue: Int
    
    var uiColor: UIColor {
        UIColor(red: fraction255(red), green: fraction255(green), blue: fraction255(blue), alpha: 1.0)
    }
    
    var highLuminance: Bool {
        let redLuminance = fraction255(red) * 0.299
        let greenLuminance = fraction255(green) * 0.587
        let blueLuminance = fraction255(blue) * 0.114
        let luminance =  redLuminance + greenLuminance + blueLuminance //(0.299 * red + 0.587 * green + 0.114 * blue) / 255.0
        // print("Luminance is \(luminance)")
        return luminance > 0.5
    }
    
    init(_ hexString: String) {
        let redString = hexString[hexString.startIndex...hexString.index(hexString.startIndex, offsetBy: 1)]
        let greenString = hexString[hexString.index(hexString.startIndex, offsetBy: 2)...hexString.index(hexString.startIndex, offsetBy: 3)]
        let blueString = hexString.suffix(2)
        
        //print("\(redString):\(greenString):\(blueString)")
        
        self.red = Int(redString, radix: 16) ?? 0
        self.green = Int(greenString, radix: 16) ?? 0
        self.blue = Int(blueString, radix: 16) ?? 0
    }
    
    private func fraction255(_ value: Int) -> CGFloat {
        let val = CGFloat(value)
        return val/255.0
    }
}
