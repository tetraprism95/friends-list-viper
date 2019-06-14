//
//  FriendGroup.swift
//  ListViperApp
//
//  Created by Nuri Chun on 6/13/19.
//  Copyright © 2019 viper. All rights reserved.
//

import Foundation

class FriendGroup {
    
    private init() {}
    static let shared = FriendGroup()
    
    public private(set) var friends: [Friend] = [
        Friend(name: "Preston Peck", age: 24),
        Friend(name: "Cory Macintosh", age: 7),
        Friend(name: "Scott Brown", age: 12),
        Friend(name: "Joseph Hu", age: 100)
    ]
    
    func addFriend(_ friend: Friend) {
        friends.append(friend)
    }
    
    func removeFriend(_ friend: Friend) {
        if let index = friends.firstIndex(where: { $0 === friend }) {
            friends.remove(at: index)
        }
    }
}
