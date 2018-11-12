//
//  CoreDataTweetTableViewController.swift
//  Smashtag
//
//  Created by Mikael Olezeski on 12/18/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import UIKit
import CoreData
import Twitter


class CoreDataTweetTableViewController: TweetTableViewController {

    var container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    override func insertTweets(_ newTweets: [Twitter.Tweet]) {
        super.insertTweets(newTweets)
        updateDatabase(with: newTweets)
    }

    func updateDatabase(with tweets: [Twitter.Tweet]) {
        container?.performBackgroundTask { [weak self] context in
            
            // Go through all hashtags and user mentions for each tweet and add them to core data
            for twitterInfo in tweets {
                for hashtag in twitterInfo.hashtags {
                    _ =  try? Mention.findOrCreateMention(matching: twitterInfo, for: (self?.searchText)!, with: hashtag.keyword, in: context)
                }
                for user in twitterInfo.userMentions {
                    _ = try? Mention.findOrCreateMention(matching: twitterInfo, for: (self?.searchText)!, with: user.keyword, in: context)
                }
            }
            try? context.save()
        }
    }
}





