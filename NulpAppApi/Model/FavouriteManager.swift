//
//  FavoriteManager.swift
//  NulpAppApi
//
//  Created by Ivan Sapiga on 10/15/18.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import Foundation

class FavouriteManager {
    // MARK: GetData
    static func getFavourites() -> [Follower] {
        guard
            let unarchivedObject = UserDefaults.standard.data(forKey: Constans.favouriteKey)
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
    
    // MARK: Delate Favourite
    static func delateFavorite(id:Int) {
        var favourites: [Follower] = []
        favourites = getFavourites()
        favourites.remove(at: id)
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: favourites)
        userDefaults.set(encodedData, forKey: Constans.favouriteKey)
        userDefaults.synchronize()
    }
    
    // MARK: Save Favorite
    static func submitDataWith(id:Int) {
        let user = FollowerManager.getFollowers()
        var favourites: [Follower] = []
        if isKeyPresentInUserDefaults() {
            favourites = getFavourites()
        }
        favourites.append(user[id])
        let placesData = favourites
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: placesData)
        userDefaults.set(encodedData, forKey: Constans.favouriteKey)
        userDefaults.synchronize()
    }
    
    static func isKeyPresentInUserDefaults() -> Bool {
        return UserDefaults.standard.object(forKey: Constans.favouriteKey) != nil
    }
    // MARK: Delate Favourites
    static func clearData() {
        UserDefaults.standard.removeObject(forKey: Constans.favouriteKey)
    }
}

private extension FavouriteManager {
    enum Constans {
        // MARK: List of Constants
        static let favouriteKey = "favorite"
    }
}
