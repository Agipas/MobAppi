//
//  FollowerTableViewCell.swift
//  NulpAppApi
//
//  Created by Ivan Sapiga on 9/26/18.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import UIKit
import moa

class FollowerTableViewCell: UITableViewCell {
    //    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    @IBOutlet weak var avatarImage: UIImageView!
    // MARK: - LifeCycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        nameLabel.text = ""
        idLabel.text = ""
        avatarImage.image = nil
        urlLabel.text = ""
    }
    
    // MARK: - Public
    
    public func configureWith(follower: Follower) {
        nameLabel.text = "Login:\(follower.login)"
        idLabel.text = "ID: \(follower.id)"
        avatarImage.moa.url = "\(follower.avatar_url)"
        urlLabel.text = "Node_id: \(follower.node_id)"
    }

}
