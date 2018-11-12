//
//  PopularityTableViewController.swift
//  Smashtag
//
//  Created by Mikael Olezeski on 12/17/17.
//  Copyright © 2017 Stanford University. All rights reserved.
//

import UIKit
import CoreData

class PopularityTableViewController: FetchedResultsTableViewController {

    // Mark: - Model
    
    var searchTerm: String? {
        didSet { updateUI() }
    }
    
    var container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    var fetchedResultsController: NSFetchedResultsController<Mention>?
    
    func updateUI() {
        if let context = container?.viewContext, searchTerm != nil {
            let request: NSFetchRequest<Mention> = Mention.fetchRequest()
            
            // sort by count and then alphabetically
            request.sortDescriptors = [NSSortDescriptor(
                key: "count",
                ascending: false,
                selector: #selector(NSString.localizedCaseInsensitiveCompare(_:))
                ), NSSortDescriptor(
                    key: "title",
                    ascending: true,
                    selector: #selector(NSString.localizedCaseInsensitiveCompare(_:))
                )]
            
            // find all mentions with search term whose tweet count is more than 1
            request.predicate = NSPredicate(format: "any searchTerm contains[c] %@ && count > 1", searchTerm!)
            fetchedResultsController = NSFetchedResultsController<Mention>(
                fetchRequest: request,
                managedObjectContext: context,
                sectionNameKeyPath: nil,
                cacheName: nil
            )
            fetchedResultsController?.delegate = self
            try? fetchedResultsController?.performFetch()
            tableView.reloadData()
        }
    }
    // Table View Setup
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Mention Cell", for: indexPath)
        
        if let mention = fetchedResultsController?.object(at: indexPath) {
            cell.textLabel?.text = mention.title
            cell.detailTextLabel?.text = "\(mention.count) tweets"
        }
        
        return cell
    }
    
    // Navigation back to searching
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
            if let dvc = segue.destination as? TweetTableViewController {
                dvc.searchText = cell.textLabel?.text
            }
        }
    }
}

