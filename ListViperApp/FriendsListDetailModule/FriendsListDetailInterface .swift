//
//  FriendsListDetailInterface .swift
//  ListViperApp
//
//  Created by Nuri Chun on 6/14/19.
//  Copyright © 2019 viper. All rights reserved.
//

import Foundation
import UIKit

protocol FriendsListDetailViewInterface: class {
    var presenter: FriendsListDetailPresenterInterface? { get set }
    
    // Presenter -> View
    func show(_ friend: Friend)
}

protocol FriendsListDetailPresenterInterface: class {
    var view: FriendsListDetailViewInterface? { get set }
    var wireframe: FriendsListDetailWireframeInterface? { get set }
    var interactor: FriendsListDetailInput? { get set }
    
    // View -> Presenter
    func viewDidLoad()
    func editFriend(name: String, age: Int)
    func deleteFriend()
}

protocol FriendsListDetailInput: class {
    var output: FriendsListDetailOutput? { get set }
    var friend: Friend? { get set }
    
    // Presenter -> Interactor
    func editFriend(name: String, age: Int)
    func deleteFriend()
}

protocol FriendsListDetailOutput: class {
    // Interactor -> Presenter
    func didEditFriend(_ friend: Friend)
    func didDeleteFriend()
}

protocol FriendsListDetailWireframeInterface: class {
    static func createFriendsListDetailWireframeModule(with friend: Friend) -> UIViewController
    
    // Presenter -> Wireframe
    func navigateBackToFriendsListViewController(from view: FriendsListDetailViewInterface)
}

