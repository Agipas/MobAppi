//
//  DetailViewController.swift
//  NulpAppApi
//
//  Created by Ivan Sapiga on 10/15/18.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import UIKit
import moa

class DetailView: UIViewController, UIGestureRecognizerDelegate {
    var follower: Follower?
    
    var imageZoomed = false
    @IBOutlet weak var followerImage: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nodeIDLabel: UILabel!
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    @IBAction func pinchImage(_ sender: UIPinchGestureRecognizer) {
        if let imageView = sender.view {
            imageView.transform = imageView.transform.scaledBy(x: sender.scale, y: sender.scale)
            sender.scale = 1
        }
    }
    
    @IBAction func rotateImage(_ sender: UIRotationGestureRecognizer) {
        if let imageView = sender.view {
            imageView.transform = imageView.transform.rotated(by: sender.rotation)
            sender.rotation = 0
        }
    }
    
//    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
//        followerImage.transform = CGAffineTransform(translationX: 30, y: 0)
//    }
    
    
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
        nodeIDLabel.text = "\(follower!.node_id)"
        idLabel.text = "\(follower!.id)"
        loginLabel.text = "\(follower!.login)"
        followerImage.moa.url = "\(follower!.avatar_url)"
        followerImage.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapImage))
        followerImage.addGestureRecognizer(tapGesture)
    }
    
    func scaleImageUp() {
        followerImage.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        imageZoomed = true
    }
    
    func normalizeImage() {
        followerImage.transform = CGAffineTransform.identity
        imageZoomed = false
    }
    
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        return true
//    }
    
//    @IBAction func followerImageZoom(_ sender: UITapGestureRecognizer) {
//        let imageView = sender.view as! UIImageView
//        let newImageView = UIImageView(image: imageView.image)
//        newImageView.frame = UIScreen.main.bounds
//        newImageView.backgroundColor = .black
//        newImageView.contentMode = .scaleAspectFit
//        newImageView.isUserInteractionEnabled = true
//        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
//        newImageView.addGestureRecognizer(tap)
//        self.view.addSubview(newImageView)
//        self.navigationController?.isNavigationBarHidden = true
//        self.tabBarController?.tabBar.isHidden = true
//    }
//
//    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
//        self.navigationController?.isNavigationBarHidden = false
//        self.tabBarController?.tabBar.isHidden = false
//        sender.view?.removeFromSuperview()
//    }
//

    
}
