//
//  FollowerTableViewCell.swift
//  NulpAppApi
//
//  Created by Ivan Sapiga on 9/26/18.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import UIKit

class FollowerTableViewCell: UITableViewCell {
    //    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var avatarLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    // MARK: - LifeCycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = ""
        idLabel.text = ""
        avatarLabel.text = ""
        urlLabel.text = ""
    }
    
    // MARK: - Public
    
    public func configureWith(follower: Follower) {
        nameLabel.text = "Login:\(String(describing: follower.login))"
        idLabel.text = "ID: \(String(describing: follower.id))"
        avatarLabel.text = "Avatar: \(String(describing: follower.avatar_url))"
        urlLabel.text = "Node_id: \(String(describing: follower.node_id))"
    }

}
