//
//  ViewController.swift
//  NulpAppApi
//
//  Created by Ivan Sapiga on 23.09.2018.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    let controllerNetworkManager: NetworkManager = NetworkManager()
    @IBAction func printData(_ sender: UIButton) {
        print(FollowerManager.getFollowers()[0])
        let placesArray = FollowerManager.getFollowers()
        print(placesArray.count)
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

