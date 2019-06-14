//
//  FriendListWireframe.swift
//  ListViperApp
//
//  Created by Nuri Chun on 6/12/19.
//  Copyright © 2019 viper. All rights reserved.
//

import UIKit

class FriendsListWireframe: FriendListWireframeInterface {
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createFriendsListModule() -> UIViewController {
        let navController = storyboard.instantiateViewController(withIdentifier: "FriendsListNavigation") as! UINavigationController
        guard let friendsListViewController = navController.topViewController as? FriendsListViewController else { fatalError("Invalid View Controller") }
        let presenter: FriendsListPresenter & FriendListInteractorOutput = FriendsListPresenter()
        let interactor: FriendListInteractorInput = FriendsListInteractor()
        let wireframe = FriendsListWireframe()
        
        friendsListViewController.presenter = presenter
        presenter.view = friendsListViewController
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.output = presenter
        
        return navController
    }
    
    func presentFriendsListDetailScreen(from view: FriendListViewInterface, for friend: Friend) {
        let friendsListDetailViewController = FriendsListDetailWireframe.createFriendsListDetailWireframeModule(with: friend)
        
        guard let friendsListDetailVC = view as? UIViewController else {
            fatalError("Invalid View Protocol Type")
        }
        
        friendsListDetailVC.navigationController?.pushViewController(friendsListDetailViewController, animated: true)
    }
    
}
