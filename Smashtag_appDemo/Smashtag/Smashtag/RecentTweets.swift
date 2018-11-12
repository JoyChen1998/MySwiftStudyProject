//
//  RecentTweets.swift
//  Smashtag
//
//  Created by Mikael Olezeski on 11/21/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import Foundation

struct RecentTweets {
    // Set up user default
    private static var userData = UserDefaults()
    
    // Create user default array
    static var searchesArray: [String] {
        return userData.object(forKey: "recentSearches") as? [String] ?? []
    }
    
    // add to user default array
    static func add(newSearch: String) {
        var newArray = searchesArray
        newArray.insert(newSearch, at: 0)
        if newArray.count > 100 {
            newArray.removeLast()
        }
        userData.set(newArray, forKey: "recentSearches")
    }
    
}
