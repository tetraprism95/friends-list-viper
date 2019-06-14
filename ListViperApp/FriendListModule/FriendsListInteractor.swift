//
//  FriendListInteractor.swift
//  ListViperApp
//
//  Created by Nuri Chun on 6/12/19.
//  Copyright © 2019 viper. All rights reserved.
//

import Foundation

class FriendsListInteractor: FriendListInteractorInput {

    weak var output: FriendListInteractorOutput?
    var friendGroup = FriendGroup.shared
    var friends: [Friend] {
        return friendGroup.friends
    }
    
    func retrieveFriends() {
        output?.didRetrieveFriends(friends)
    }
    
    func saveFriend(_ friend: Friend) {
        friendGroup.addFriend(friend)
        output?.didAddFriend(friend)
    }
    
    func deleteFriend(_ friend: Friend) {
        friendGroup.removeFriend(friend)
        output?.didRemoveFriend(friend)
    }

}
