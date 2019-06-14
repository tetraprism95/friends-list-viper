//
//  FriendsListDetailViewController.swift
//  ListViperApp
//
//  Created by Nuri Chun on 6/14/19.
//  Copyright © 2019 viper. All rights reserved.
//

import Foundation
import UIKit

class FriendsListDetailViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    
    var presenter: FriendsListDetailPresenterInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func deleteFriend(_ sender: Any) {
        presenter?.deleteFriend()
    }
    
    @IBAction func editFriend(_ sender: Any) {
        let alertController = UIAlertController(title: "Edit Friend", message: "Enter name and age", preferredStyle: .alert)
        
        alertController.addTextField(configurationHandler: { $0.text = self.nameLabel.text})
        alertController.addTextField(configurationHandler: { $0.text = self.ageLabel.text})
        alertController.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak self] _ in
            let nameText = alertController.textFields?[0].text ?? ""
            let ageText = alertController.textFields?[1].text ?? ""
            guard !nameText.isEmpty else { return }
            
            self?.presenter?.editFriend(name: nameText, age: Int(ageText) ?? 0)
        }))
    }
}

extension FriendsListDetailViewController: FriendsListDetailViewInterface {

    func show(_ friend: Friend) {
        nameLabel.text = friend.name
        ageLabel.text = "\(friend.age)"
    }
    
}
