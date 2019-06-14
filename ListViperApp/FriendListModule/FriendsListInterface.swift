//
//  FriendsListInterface.swift
//  ListViperApp
//
//  Created by Nuri Chun on 6/13/19.
//  Copyright © 2019 viper. All rights reserved.
//

import Foundation
import UIKit

protocol FriendListViewInterface: class {
    var presenter: FriendListPresenterInterface? { get set }
    
    // Presenter -> View
    func showFriends(_ friends: [Friend])
    func showErrorMessage(_ message: String)
}

protocol FriendListPresenterInterface: class {
    var view: FriendListViewInterface? { get set }
    var interactor: FriendListInteractorInput? { get set }
    var wireframe: FriendListWireframeInterface? { get set }
    
    // View -> Presenter
    func viewWillAppear()
    func showFriendsDetails(_ friend: Friend)
    func addFriend(_ friend: Friend)
    func removeFriend(_ friend: Friend)
}

protocol FriendListInteractorInput: class {
    var output: FriendListInteractorOutput? { get set }
    
    // Presenter -> Interactor
    func retrieveFriends()
    func saveFriend(_ friend: Friend)
    func deleteFriend(_ friend: Friend)
}

protocol FriendListInteractorOutput: class {
    // Interactor -> Presenter
    func didAddFriend(_ friend: Friend)
    func didRemoveFriend(_ friend: Friend)
    func didRetrieveFriends(_ friends: [Friend])
    func onError(message: String)
}

protocol FriendListWireframeInterface: class {
    static func createFriendsListModule() -> UIViewController
    
    // Presenter -> Router
    func presentFriendsListDetailScreen(from view: FriendListViewInterface, for friend: Friend) 
}
