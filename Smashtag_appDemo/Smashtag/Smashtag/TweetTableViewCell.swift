//
//  TweetTableViewCell.swift
//  Smashtag
//
//  Created by CS193p Instructor on 2/8/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import UIKit
import Twitter

class TweetTableViewCell: UITableViewCell
{
    // outlets to the UI components in our Custom UITableViewCell
    @IBOutlet weak var tweetProfileImageView: UIImageView!
    @IBOutlet weak var tweetCreatedLabel: UILabel!
    @IBOutlet weak var tweetUserLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!

    // public API of this UITableViewCell subclass
    // each row in the table has its own instance of this class
    // and each instance will have its own tweet to show
    // as set by this var
    var tweet: Twitter.Tweet? { didSet { updateUI() } }
    
    // whenever our public API tweet is set
    // we just update our outlets using this method
    private func updateUI() {
        tweetTextLabel?.attributedText = highlightedMentionsText(tweet)
        tweetUserLabel?.text = tweet?.user.description
        if let profileImageURL = tweet?.user.profileImageURL {
            if let imageData = try? Data(contentsOf: profileImageURL) {
                DispatchQueue.main.async { [weak self] in
                    self?.tweetProfileImageView?.image = UIImage(data: imageData)
                }
            }
        } else {
            tweetProfileImageView?.image = nil
        }
        
        if let created = tweet?.created {
            let formatter = DateFormatter()
            if Date().timeIntervalSince(created) > 24*60*60 {
                formatter.dateStyle = .short
            } else {
                formatter.timeStyle = .short
            }
            tweetCreatedLabel?.text = formatter.string(from: created)
        } else {
            tweetCreatedLabel?.text = nil
        }
    }
    
    private struct Colors {
        static let userMention = UIColor.green
        static let hashtag = UIColor.orange
        static let URL = UIColor.blue
    }
    
    private func highlightedMentionsText(_ tweet: Twitter.Tweet?) -> NSAttributedString? {
        if let tweet = tweet {
           let attributedText = NSMutableAttributedString(string: tweet.text)
            for hashtags in tweet.hashtags {
                attributedText.addAttribute(NSForegroundColorAttributeName, value: Colors.hashtag, range: hashtags.nsrange)
            }
            for userMentions in tweet.userMentions {
                attributedText.addAttribute(NSForegroundColorAttributeName, value: Colors.userMention, range: userMentions.nsrange)
            }
            for URLs in tweet.urls {
                attributedText.addAttribute(NSForegroundColorAttributeName, value: Colors.URL, range: URLs.nsrange)
            }
            return attributedText
        }
        return nil
    }
}
