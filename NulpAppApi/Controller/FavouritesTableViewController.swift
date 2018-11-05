//
//  FavouritesTableViewController.swift
//  NulpAppApi
//
//  Created by Ivan Sapiga on 10/15/18.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import UIKit

class FavouritesTableViewController: UITableViewController {
    let placesArray = FavouriteManager.getFavourites()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favoгrites"
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selected = placesArray[indexPath.row]
                destination.follower = selected
            }
        }
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FollowerTableViewCell.self), for: indexPath) as! FollowerTableViewCell
        let follower = placesArray[indexPath.row]
        cell.configureWith(follower: follower)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        FavouriteManager.delateFavorite(id:indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
}
