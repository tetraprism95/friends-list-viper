//
//  FriendsListDetailPresenter.swift
//  ListViperApp
//
//  Created by Nuri Chun on 6/14/19.
//  Copyright © 2019 viper. All rights reserved.
//

import Foundation

class FriendsListDetailPresenter: FriendsListDetailPresenterInterface {
    
    weak var view: FriendsListDetailViewInterface?
    var wireframe: FriendsListDetailWireframeInterface?
    var interactor: FriendsListDetailInput?
    
    func viewDidLoad() {
        if let friend = interactor?.friend {
            view?.show(friend)
        }
    }
    
    func editFriend(name: String, age: Int) {
        interactor?.editFriend(name: name, age: age)
    }
    
    func deleteFriend() {
        interactor?.deleteFriend()
    }
    
}

extension FriendsListDetailPresenter: FriendsListDetailOutput {
    
    func didEditFriend(_ friend: Friend) {
        view?.show(friend)
    }
    
    func didDeleteFriend() {
        if let view = view {
            wireframe?.navigateBackToFriendsListViewController(from: view)
        }
    }
    
}
