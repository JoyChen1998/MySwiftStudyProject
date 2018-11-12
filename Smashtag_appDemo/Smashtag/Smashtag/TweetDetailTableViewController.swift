//
//  TweetDetailTableViewController.swift
//  Smashtag
//
//  Created by Mikael Olezeski on 11/2/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import UIKit
import Twitter

protocol TweetTableViewControllerDelegate: class {
    func searchWithString(string: String)
}

class TweetDetailTableViewController: UITableViewController {
    
    // Model
    // Data structure made to make table view setup easier
    
    private var detailMentions = [DetailSection]()
    var delegate: TweetTableViewControllerDelegate?
    
    var tweet: Twitter.Tweet? {
        didSet {
            if let images = tweet?.media, !(tweet?.media.isEmpty)! {
                let imageSection = DetailSection(media: images.map{MediaType.image($0.url, $0.aspectRatio)}, sectionName: SectionNames.image)
                detailMentions.append(imageSection)
            }
            if let hashtags = tweet?.hashtags, !(tweet?.hashtags.isEmpty)! {
                let hashtagSection = DetailSection(media: hashtags.map{MediaType.mention($0.keyword)}, sectionName: SectionNames.hashtag)
                detailMentions.append(hashtagSection)
            }
            if let users = tweet?.userMentions, !(tweet?.userMentions.isEmpty)! {
                let userSection = DetailSection(media: users.map{MediaType.mention($0.keyword)}, sectionName: SectionNames.user)
                detailMentions.append(userSection)
            }
            if let urls = tweet?.urls, !(tweet?.urls.isEmpty)! {
                let urlSection = DetailSection(media: urls.map{MediaType.mention($0.keyword)}, sectionName: SectionNames.url)
                detailMentions.append(urlSection)
            }
        }
    }
    
    
    private struct DetailSection {
        var media: [MediaType]?
        var sectionName: String
    }
    
    private enum MediaType {
        case mention(String)
        case image (URL, Double)
    }
    
    private struct SectionNames {
        static let image = "Images"
        static let hashtag = "Hashtags"
        static let user = "Users"
        static let url = "URLs"
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return detailMentions.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailMentions[section].media!.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return detailMentions[section].sectionName
    }
    
    // Set row height to image height for image section
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch detailMentions[indexPath.section].media![indexPath.row] {
        case .mention(_):
            return UITableViewAutomaticDimension
        
        case .image(_, let aspectRatio):
            return (tableView.frame.size.width / CGFloat(aspectRatio))
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> TweetDetailTableViewCell {
        var cell: TweetDetailTableViewCell
    
        switch detailMentions[indexPath.section].media![indexPath.row] {
        case let .mention( mentionKeyword):
            cell = tableView.dequeueReusableCell(withIdentifier: "mentionCell", for: indexPath) as! TweetDetailTableViewCell
            cell.textLabel?.text = mentionKeyword
        case let .image( url,  aspectRatio):
            cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! TweetDetailTableViewCell
            cell.aspectRatio = aspectRatio
            cell.imageURL = url
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionheader = detailMentions[indexPath.section]
        switch sectionheader.sectionName {
        case SectionNames.url:
            // Get link and open url
                let urlLink = tableView.cellForRow(at: indexPath)?.textLabel?.text
                if let url = URL(string: urlLink!) {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                    else {
                        UIApplication.shared.openURL(url)
                    }
            }
        case SectionNames.hashtag, SectionNames.user:
            // Return to original VC and search for string
            let searchText = tableView.cellForRow(at: indexPath)?.textLabel?.text
            delegate?.searchWithString(string: searchText!)
            navigationController?.popViewController(animated: true)
        default:
            break
        }
    }

    
    // MARK: - Navigation

    // Transition to new image view when an image is selected
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if let cell = sender as? TweetDetailTableViewCell {
            if cell.textLabel?.text == SectionNames.url  {
                return false
            }
        }
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? TweetDetailTableViewCell {
            if segue.identifier == "showImage" {
                if let ivc = segue.destination.content as? ImageViewController {
                    ivc.detailImageURL = cell.imageURL
                }
            }
        }
    }
    
    // Open safari page from url


}















