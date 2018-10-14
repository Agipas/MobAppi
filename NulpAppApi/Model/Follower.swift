//
//  Follower.swift
//  NulpAppApi
//
//  Created by Ivan Sapiga on 9/25/18.
//  Copyright © 2018 Ivan Sapiga. All rights reserved.
//

import Foundation

//struct Follower: Codable {
//    var id : Int
//    var login : String
//    var node_id : String
//    var avatar_url : String
//
//    init(id : Int, login : String, node_id : String, avatar_url : String) {
//        self.id = id
//        self.login = login
//        self.node_id = node_id
//        self.avatar_url = avatar_url
//    }

//    private enum CodingKeys: String, CodingKey {
//        case id
//        case login
//        case node_id
//        case avatar_url = "avatar_url"
//    }
//}

class Follower: NSObject, NSCoding , Codable {
    
    var id : Int
    var login : String
    var node_id : String
    var avatar_url : String

    init(id: Int, login: String, node_id: String, avatar_url: String) {
        self.id = id
        self.login = login
        self.node_id = node_id
        self.avatar_url = avatar_url
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.login, forKey: "login")
        aCoder.encode(self.node_id, forKey: "node_id")
        aCoder.encode(self.avatar_url, forKey: "avatar_url")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeInteger(forKey: "id") 
        self.login = aDecoder.decodeObject(forKey: "login") as! String
        self.node_id = aDecoder.decodeObject(forKey: "node_id") as! String
        self.avatar_url = aDecoder.decodeObject(forKey: "avatar_url") as! String
    }
}
