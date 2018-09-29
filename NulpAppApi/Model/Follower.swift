//
//  Follower.swift
//  NulpAppApi
//
//  Created by Ivan Sapiga on 9/25/18.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import Foundation

struct Follower: Codable {
    var id : Int
    var login : String
    var url : URL
    var avatar_url : URL
    
    init(id : Int, login : String,url : URL, avatar_url : URL) {
        self.id = id
        self.login = login
        self.url = url
        self.avatar_url = avatar_url
    }
}

let USER_URL = URL(string: "https://api.github.com/users/Agipas/following")!
