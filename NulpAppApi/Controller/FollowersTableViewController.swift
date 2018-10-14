//
//  FollowersTableViewController.swift
//  NulpAppApi
//
//  Created by Ivan Sapiga on 10/2/18.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import UIKit

class FollowersTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Followers"
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let placesArray = FollowerManager.getFollowers()
        return placesArray.count
        
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FollowerTableViewCell.self), for: indexPath) as! FollowerTableViewCell

        let placesArray = FollowerManager.getFollowers()
        let follower = placesArray[indexPath.row]
        
        cell.configureWith(follower: follower)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }

}
