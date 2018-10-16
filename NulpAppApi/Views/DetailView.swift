//
//  DetailViewController.swift
//  NulpAppApi
//
//  Created by Ivan Sapiga on 10/15/18.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import UIKit
import moa

class DetailView: UIViewController {
    @IBOutlet weak var followerImage: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nodeIDLabel: UILabel!
    var follower: Follower?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nodeIDLabel.text = "\(follower!.node_id)"
        idLabel.text = "\(follower!.id)"
        loginLabel.text = "\(follower!.login)"
        followerImage.moa.url = "\(follower!.avatar_url)"
    }
}
