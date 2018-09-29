//
//  FollowerManager.swift
//  NulpAppApi
//
//  Created by Ivan Sapiga on 9/26/18.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import Foundation

class FollowerManager {
    
    static func getFollowers() -> [Follower] {
        if let placesData = UserDefaults.standard.data(forKey: Constans.followerKey) {
            let placeArray = try? JSONDecoder().decode([Follower].self, from: placesData)
            return placeArray!
        } else {
            return []
        }
    }
    
     static func submitDataWith(follower: Follower) {
        var followers: [Follower] = []
    
        if isKeyPresentInUserDefaults() {
            followers = FollowerManager.getFollowers()
            followers.append(follower)
            let placesData = try! JSONEncoder().encode(followers)
            UserDefaults.standard.removeObject(forKey: Constans.followerKey)
            UserDefaults.standard.set(placesData, forKey: Constans.followerKey)
            UserDefaults.standard.synchronize()
        } else if (isKeyPresentInUserDefaults() != true){
            followers.append(follower)
            let placesData = try! JSONEncoder().encode(followers)
            UserDefaults.standard.set(placesData, forKey: Constans.followerKey)
            UserDefaults.standard.synchronize()
        }
        
    }
    
    static func crearData() {
        UserDefaults.standard.removeObject(forKey: Constans.followerKey)
    }
    
    static func isKeyPresentInUserDefaults() -> Bool {
        return UserDefaults.standard.object(forKey: Constans.followerKey) != nil
    }
    
    static func clearData() {
        UserDefaults.standard.removeObject(forKey: Constans.followerKey)
    }
}

private extension FollowerManager {
    enum Constans {
        static let followerKey = "follower"
    }
}
