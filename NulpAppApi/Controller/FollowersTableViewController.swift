//
//  FollowersTableViewController.swift
//  NulpAppApi
//
//  Created by Ivan Sapiga on 10/2/18.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import UIKit


class FollowersTableViewController: UITableViewController  {
    
    var refresher: UIRefreshControl{
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .black
        refreshControl.addTarget(self, action: #selector(requestData), for: .valueChanged)
        
        return refreshControl
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Followers"
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.refreshControl = refresher
        
        // Optionally remove seperator lines from empty cells
//        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    let network = NetworkManager()
    @objc
    func requestData() {
        FollowerManager.clearData()
        network.getData()
        
        let deadLine = DispatchTime.now() + .milliseconds(700)
        DispatchQueue.main.asyncAfter(deadline: deadLine){
            self.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let placesArray = FollowerManager.getFollowers()
        
        if placesArray.count > 0 {
            EmptyMessage(message: "", viewController: self)
            return placesArray.count
        } else {
            EmptyMessage(message: "You don't have any followers. \n Please Scroll down to reload", viewController: self)
            return 0
        }
        
    }
    
    func EmptyMessage(message:String, viewController:UITableViewController) {
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height))
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
}
