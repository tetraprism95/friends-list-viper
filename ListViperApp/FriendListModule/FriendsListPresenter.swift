//
//  FriendListPresenter.swift
//  ListViperApp
//
//  Created by Nuri Chun on 6/12/19.
//  Copyright © 2019 viper. All rights reserved.
//

import Foundation

class FriendsListPresenter {
    weak var view: FriendListViewInterface?
    var interactor: FriendListInteractorInput?
    var wireframe: FriendListWireframeInterface?
}

extension FriendsListPresenter: FriendListPresenterInterface {
    
    func viewWillAppear() {
        interactor?.retrieveFriends()
    }
    
    func showFriendsDetails(_ friend: Friend) {
        guard let view = view else { return }
        wireframe?.presentFriendsListDetailScreen(from: view, for: friend)
    }
    
    func addFriend(_ friend: Friend) {
        interactor?.saveFriend(friend)
    }
    
    func removeFriend(_ friend: Friend) {
        interactor?.deleteFriend(friend)
    }
    
}

extension FriendsListPresenter: FriendListInteractorOutput {
    
    func didAddFriend(_ friend: Friend) {
        interactor?.retrieveFriends()
    }
    
    func didRemoveFriend(_ friend: Friend) {
        interactor?.retrieveFriends()
    }
    
    func didRetrieveFriends(_ friends: [Friend]) {
        view?.showFriends(friends)
    }
    
    func onError(message: String) {
        view?.showErrorMessage(message)
    }
    
}
