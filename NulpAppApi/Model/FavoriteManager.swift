//
//  FavoriteManager.swift
//  NulpAppApi
//
//  Created by Ivan Sapiga on 10/15/18.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import Foundation

class FavoriteManager {
    static func getFavorites() -> [Follower] {
        guard
            let unarchivedObject = UserDefaults.standard.data(forKey: Constans.followerKey)
            else {
                return []
        }
        do {
            guard let array = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(unarchivedObject) as? [Follower] else {
                fatalError("Can't get Array")
            }
            return array
        } catch {
            fatalError("Can't encode data: \(error)")
        }
    }
    
    static func delateFavorite(id:Int) {
        var followers: [Follower] = []
        followers = FollowerManager.getFollowers()
        followers.remove(at: id)
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: followers)
        userDefaults.set(encodedData, forKey: Constans.followerKey)
        userDefaults.synchronize()
    }
    
    static func submitDataWith(follower: Follower) {
        var followers: [Follower] = []
        
        if isKeyPresentInUserDefaults() {
            followers = FollowerManager.getFollowers()
        }
        followers.append(follower)
        let placesData = followers
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: placesData)
        userDefaults.set(encodedData, forKey: Constans.followerKey)
        userDefaults.synchronize()
    }
    
    static func isKeyPresentInUserDefaults() -> Bool {
        return UserDefaults.standard.object(forKey: Constans.followerKey) != nil
    }
    
    static func clearData() {
        UserDefaults.standard.removeObject(forKey: Constans.followerKey)
    }
}

private extension FavoriteManager {
    enum Constans {
        static let followerKey = "favorite"
    }
}
