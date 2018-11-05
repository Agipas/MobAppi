//
//  ViewController.swift
//  NulpAppApi
//
//  Created by Ivan Sapiga on 23.09.2018.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import UIKit
import Alamofire


class BasicViewController: UIViewController {
    let controllerNetworkManager: NetworkManager = NetworkManager()
    
    @IBAction func printData(_ sender: UIButton) {
        if  FollowerManager.isKeyPresentInUserDefaults() {
            let follower0 = FollowerManager.getFollowers()[0]
            print(follower0)
        }
        let placesArray = FollowerManager.getFollowers()
        print(placesArray)
    }
    @IBAction func clearButton(_ sender: UIButton) {
        FollowerManager.clearData()
    }
    
    @IBAction func getFollowersButton(_ sender: UIButton) {
            controllerNetworkManager.getData()
    }

        override func viewDidLoad() {
            super.viewDidLoad()
        }
    
}

