//
//  FavouritesTableViewController.swift
//  NulpAppApi
//
//  Created by Ivan Sapiga on 10/15/18.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import UIKit

class FavouritesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Favorites"
        self.navigationItem.rightBarButtonItem = self.editButtonItem

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let placesArray = FollowerManager.getFollowers()
        return placesArray.count
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FollowerTableViewCell.self), for: indexPath) as! FollowerTableViewCell
        let placesArray = FollowerManager.getFollowers()
        let follower = placesArray[indexPath.row]
        cell.configureWith(follower: follower)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        FollowerManager.delateFollower(id:indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailView {
            let placesArray = FavoriteManager.getFavorites()
            destination.follower = placesArray[(tableView.indexPathForSelectedRow?.row)!]
        }
    }

}
