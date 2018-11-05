//
//  FollowerManager.swift
//  NulpAppApi
//
//  Created by Ivan Sapiga on 9/26/18.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//
//let decoded  = userDefaults.object(forKey: Constans.followerKe) as! Data
//let decodedTeams = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [Team]

import Foundation

class FollowerManager {
    //MARK: - Get Followers
    static func getFollowers() -> [Follower] {
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
    //MARK: - Delate Follower
    static func delateFollower(id:Int) {
        var followers: [Follower] = []
        followers = getFollowers()
        followers.remove(at: id)
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: followers)
        userDefaults.set(encodedData, forKey: Constans.followerKey)
        userDefaults.synchronize()
    }
    
       //MARK: - Save Followers
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
    //MARK: - Delate Followers
    static func clearData() {
        UserDefaults.standard.removeObject(forKey: Constans.followerKey)
    }
}

private extension FollowerManager {
    enum Constans {
        static let followerKey = "follower"
    }
}
