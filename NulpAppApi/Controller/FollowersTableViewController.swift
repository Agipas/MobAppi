//
//  FollowersTableViewController.swift
//  NulpAppApi
//
//  Created by Ivan Sapiga on 10/2/18.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import UIKit


class FollowersTableViewController: UITableViewController  {
    
    let network = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Followers"
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.refreshControl = refresher
    }
    
    //MARK: RefreshControler
    private var refresher: UIRefreshControl{
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .black
        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        return refreshControl
    }
    
    //MARK: Delate Followers
    @objc
    private func requestData() {
        FollowerManager.clearData()
        network.getData()
        
        let deadLine = DispatchTime.now() + .milliseconds(700)
        DispatchQueue.main.asyncAfter(deadline: deadLine){
            self.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
    //MERK: EmptyMessage
    private func emptyMessage(message:String, viewController:UITableViewController) {
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: view.bounds.size.width, height: view.bounds.size.height))
        let messageLabel = UILabel(frame: rect)
        messageLabel.text = message
        messageLabel.textColor = UIColor.black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 20)
        messageLabel.sizeToFit()
        
        viewController.tableView.backgroundView = messageLabel;
        viewController.tableView.separatorStyle = .none;
    }
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let placesArray = FollowerManager.getFollowers()
                let selected = placesArray[indexPath.row]
                destination.follower = selected
            }
        }
    }
    // MARK: - Table view  delegate
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let favourite = importantAction(at: indexPath)
        let delate = delateAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [favourite,delate])
    }
    
    private func importantAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "Favourite") { (action, view, completion) in
            FavouriteManager.submitDataWith(id:indexPath.row)
            completion(true)
        }
        action.image = UIImage(named: "star")
        action.backgroundColor = #colorLiteral(red: 0.2708427579, green: 0.8235294223, blue: 0.1867830006, alpha: 1)
        return action
    }
    
    private func delateAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "Delate") { (action, view, completion) in
            FollowerManager.delateFollower(id:indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        action.image = UIImage(named: "trash")
        action.backgroundColor = .red
        return action
    }
    
    //MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FollowerTableViewCell.self), for: indexPath) as! FollowerTableViewCell
        let placesArray = FollowerManager.getFollowers()
        let follower = placesArray[indexPath.row]
        cell.configureWith(follower: follower)
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        guard editingStyle == .delete else { return }
//        FollowerManager.delateFollower(id:indexPath.row)
//        tableView.deleteRows(at: [indexPath], with: .automatic)
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let placesArray = FollowerManager.getFollowers()
        if placesArray.count > 0 {
            emptyMessage(message: "", viewController: self)
            return placesArray.count
        } else {
            emptyMessage(message: "You don't have any followers. \n Please Scroll down to reload", viewController: self)
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
}
