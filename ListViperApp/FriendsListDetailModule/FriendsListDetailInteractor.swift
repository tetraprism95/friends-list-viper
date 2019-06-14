//
//  FriendsListDetailInteractor.swift
//  ListViperApp
//
//  Created by Nuri Chun on 6/14/19.
//  Copyright © 2019 viper. All rights reserved.
//

import Foundation

class FriendsListDetailInteractor: FriendsListDetailInput {
    
    weak var output: FriendsListDetailOutput?
    var friendGroup = FriendGroup.shared
    var friend: Friend?
    
    func editFriend(name: String, age: Int) {
        guard let friend = friend else { return }
        friend.name = name
        friend.age = age
        output?.didEditFriend(friend)
    }
    
    func deleteFriend() {
        guard let friend = friend else  { return }
        friendGroup.removeFriend(friend)
        output?.didDeleteFriend()
    }

}
