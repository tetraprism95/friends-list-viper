//
//  FriendListViewController.swift
//  ListViperApp
//
//  Created by Nuri Chun on 6/12/19.
//  Copyright © 2019 viper. All rights reserved.
//

import UIKit

class FriendsListViewController: UITableViewController {
    
    let cellId = "CellId"
    
    var presenter: FriendListPresenterInterface?
    var friends: [Friend] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewWillAppear()
    }
    
    private func setupView() {
        tableView.tableFooterView = UIView()
    }
    
    @IBAction func addFriend(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Friend", message: "Enter name and age", preferredStyle: .alert)
        alertController.addTextField(configurationHandler: nil)
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { [weak self] _ in
            let nameText = alertController.textFields?[0].text ?? ""
            let ageText = alertController.textFields?[1].text ?? ""
            guard !nameText.isEmpty else { return }
            
            let friend = Friend(name: nameText, age: Int(ageText) ?? 0) 
            self?.presenter?.addFriend(friend)
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}

extension FriendsListViewController: FriendListViewInterface {
    
    func showFriends(_ friends: [Friend]) {
        self.friends = friends
    }
    
    func showErrorMessage(_ message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}

// MARK: - UITableView [Delegate & DataSource]
extension FriendsListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let friend = friends[indexPath.row]
        cell.textLabel?.text = friend.name
        cell.detailTextLabel?.text = String(friend.age)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friend = friends[indexPath.row]
        presenter?.showFriendsDetails(friend)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let friend = friends[indexPath.row]
            presenter?.removeFriend(friend) 
        }
    }
    
    
    
}
