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
        nameLabel.text = "Name: \(follower.login)"
        idLabel.text = "Second Name: \(follower.id)"
        avatarLabel.text = "Avatar: \(follower.avatar_url)"
        urlLabel.text = "URL: \(follower.url)"
    }

}
