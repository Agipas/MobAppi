//
//  DetailViewController.swift
//  NulpAppApi
//
//  Created by Ivan Sapiga on 10/15/18.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import UIKit
import moa

class DetailViewController: UIViewController, UIGestureRecognizerDelegate {
    var follower: Follower?
    
    var imageZoomed = false

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var iDLabel: UILabel!
    @IBOutlet weak var nodeIDLabel: UILabel!
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    @IBAction func tapImage(_ sender: Any) {
        if (!imageZoomed) {
            scaleImageUp()
            imageZoomed = true
        } else {
            normalizeImage()
            imageZoomed = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nodeIDLabel.text = "Node ID: \(follower!.node_id)"
        iDLabel.text = "ID: \(follower!.id)"
        loginLabel.text = "Login: \(follower!.login)"
        userImage.moa.url = "\(follower!.avatar_url)"
        userImage.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapImage))
        tapGesture.numberOfTapsRequired = 2
        userImage.addGestureRecognizer(tapGesture)
    }
    
    func scaleImageUp() {
        userImage.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        imageZoomed = true
    }
    
    func normalizeImage() {
        userImage.transform = CGAffineTransform.identity
        imageZoomed = false
    }

}
