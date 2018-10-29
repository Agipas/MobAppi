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
        if let destination = segue.destination as? DetailView {
            destination.follower = placesArray[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    // MARK: - Table view  delegate
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let favourite = importantAction(at: indexPath)
        let delate = delateAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [delate])
    }
    
    func delateAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "Delate") { (action, view, completion) in
            FavouriteManager.delateFavorite(id:indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.image = UIImage(named: "trash")
        action.backgroundColor = .red
        return action
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FollowerTableViewCell.self), for: indexPath) as! FollowerTableViewCell
        let follower = placesArray[indexPath.row]
        cell.configureWith(follower: follower)
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        guard editingStyle == .delete else { return }
//        FavouriteManager.delateFavorite(id:indexPath.row)
//        tableView.deleteRows(at: [indexPath], with: .automatic)
//        self.tableView.reloadData()
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
}
