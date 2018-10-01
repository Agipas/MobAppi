//
//  NetworkManager.swift
//  NulpAppApi
//
//  Created by Ivan Sapiga on 9/27/18.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    var follower = [Follower]()
    
    public func getData() {
        Alamofire.request(USER_URL).responseJSON { response in
            let json = response.data
            do{
                //created the json decoder
                let decoder = JSONDecoder()
                //using the array to put values
                self.follower = try decoder.decode([Follower].self, from: json!)
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
}
let USER_URL = URL(string: "https://api.github.com/users/Agipas/following")!
