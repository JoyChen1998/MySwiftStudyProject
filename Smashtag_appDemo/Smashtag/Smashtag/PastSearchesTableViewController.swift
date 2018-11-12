//
//  PastSearchesTableViewController.swift
//  Smashtag
//
//  Created by Mikael Olezeski on 11/21/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import UIKit

class PastSearchesTableViewController: UITableViewController {

    // MARK: - Model
    private var searchedTweets: [String] {
        return RecentTweets.searchesArray
    }
    
    // Mark: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedTweets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = searchedTweets[indexPath.row]

        return cell
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
            switch segue.identifier {
            case "SearchAgain"?:
                if let dvc = segue.destination as? TweetTableViewController {
                    dvc.searchText = cell.textLabel?.text
                }
            case "ShowPopular"?:
                if let dvc = segue.destination as? PopularityTableViewController {
                    dvc.searchTerm = cell.textLabel?.text
                }
            default:
                break
            }
        }
    }

}
