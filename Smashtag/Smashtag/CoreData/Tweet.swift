//
//  Tweet.swift
//  Smashtag
//
//  Created by Mikael Olezeski on 12/18/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import UIKit
import Twitter
import CoreData

class Tweet: NSManagedObject {
    
    class func findOrCreateTweet(matching twitterInfo: Twitter.Tweet, with mention: Mention, for searchText: String, in context: NSManagedObjectContext)  -> Tweet? {
        let request: NSFetchRequest<Tweet> = Tweet.fetchRequest()
        
        // search for tweets (unique) that have specific mention found in a specific search
        request.predicate = NSPredicate(format: "unique = %@ && mention = %@ && mention.searchTerm = %@", twitterInfo.identifier, mention, searchText)
        if let tweet = try? context.fetch(request) {
            if tweet.count > 0 {
                
                // if tweet already exists in the mention for that search term, there is no need to add it again, so return nil
                return nil
            }
        }
        
        // else we return the new tweet to add it to the mention
        let tweet = Tweet(context: context)
        tweet.unique = twitterInfo.identifier
        return tweet
    }
}
