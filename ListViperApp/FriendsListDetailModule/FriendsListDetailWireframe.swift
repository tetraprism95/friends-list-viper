//
//  FriendsListDetailWireframe.swift
//  ListViperApp
//
//  Created by Nuri Chun on 6/14/19.
//  Copyright © 2019 viper. All rights reserved.
//

import Foundation
import UIKit

class FriendsListDetailWireframe: FriendsListDetailWireframeInterface {
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createFriendsListDetailWireframeModule(with friend: Friend) -> UIViewController {
        guard let friendsListDetailVC = storyboard.instantiateViewController(withIdentifier: "FriendsListDetailViewController") as? FriendsListDetailViewController else {
            fatalError("Invalid view controller type")
        }
        
        let presenter: FriendsListDetailPresenter & FriendsListDetailOutput = FriendsListDetailPresenter()
        friendsListDetailVC.presenter = presenter
        presenter.view = friendsListDetailVC
        
        let interactor: FriendsListDetailInput = FriendsListDetailInteractor()
        interactor.friend = friend
        interactor.output = presenter
        presenter.interactor = interactor
        
        let wireframe: FriendsListDetailWireframeInterface = FriendsListDetailWireframe()
        presenter.wireframe = wireframe
        
        return friendsListDetailVC
    }
    
    func navigateBackToFriendsListViewController(from view: FriendsListDetailViewInterface) {
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid view protocol type")
        }
        
        viewVC.navigationController?.popViewController(animated: true)
    }
    
}
