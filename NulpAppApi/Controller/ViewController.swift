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
    var follower = [Follower]()
//    let controllerFollowerManager: FollowerManager = FollowerManager()
    @IBAction func printData(_ sender: UIButton) {
        print(FollowerManager.getFollowers()[0].id)
        let placesArray = FollowerManager.getFollowers()
        print(placesArray.count)
    }
    @IBAction func clearButton(_ sender: UIButton) {
        FollowerManager.clearData()
    }
    
    @IBAction func getFollowersButton(_ sender: UIButton) {
        Alamofire.request(USER_URL).responseJSON { response in
            let json = response.data
            
            do{
                //created the json decoder
                let decoder = JSONDecoder()
                //using the array to put values
                self.follower = try decoder.decode([Follower].self, from: json!)
                //                     print(self.follower[0])
                //printing all the hero names
                
                //                    print(self.follower)
                for user in self.follower{
                    let follower = Follower(id : user.id, login : user.login ,url : user.url, avatar_url : user.avatar_url)
                    FollowerManager.submitDataWith(follower: follower)
                }
            }catch let err{
                print(err)
            }
        }
                    
    }

        override func viewDidLoad() {
            super.viewDidLoad()

        }
    
}

