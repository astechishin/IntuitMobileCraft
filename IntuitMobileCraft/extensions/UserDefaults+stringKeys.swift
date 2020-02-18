//
//  UserDefaults+stringKeys.swift
//  IntuitMobileCraft
//
//  Created by Andy Stechishin on 2020-02-17.
//  Copyright © 2020 Andy Stechishin. All rights reserved.
//

import Foundation

extension UserDefaults {
    struct Key<Value> {
        fileprivate var name: String
        
        init(name: String) {
            self.name = name
        }
    }
    
    func set<Value>(key: Key<Value>, to value: Value) {
        set(value, forKey: key.name)
    }
    
    func value<Value>(for key: Key<Value>) -> Value? {
        return value(forKey: key.name) as? Value
    }
    
    func remove<Value>(for key: Key<Value>) {
        removeObject(forKey: key.name)
    }
}

extension UserDefaults {
    enum Theme: String {
        case light, dark
    }
}

extension UserDefaults.Key where Value == UserDefaults.Theme {
    static let theme = UserDefaults.Key<UserDefaults.Theme>(name: "theme")
    
    // can use with: UserDefaults.standard.set(key: .theme, to: .dark)
}

extension UserDefaults.Key where Value == Int {
    static let launchCount = UserDefaults.Key<Int>(name: "launchCount")
    
    // Add the following to AppDelegate:
    // let count = UserDefaults.standard.value(for: .launchCount) ?? 0
    // UserDefaults.standard.set(key: .launchCount, to: count + 1)
}

extension UserDefaults.Key where Value == String {
    static let githubOrganization = UserDefaults.Key<String>(name: "githubOrganization")
}
