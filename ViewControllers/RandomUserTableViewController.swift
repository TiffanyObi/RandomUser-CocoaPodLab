//
//  RandomUserTableViewController.swift
//  RandomUser-CocoaPodLab
//
//  Created by Tiffany Obi on 2/28/20.
//  Copyright © 2020 Tiffany Obi. All rights reserved.
//

import UIKit

class RandomUserTableViewController: UIViewController {
    
    private let randomUserView = RandomUserView()
    private var randomUsers = [User]() {
        didSet {
            DispatchQueue.main.async {
           
            self.randomUserView.tableView.reloadData()
    }
}
    }
    override func loadView() {

        view = randomUserView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
      
        getRandomUsers()
        
        randomUserView.tableView.dataSource = self
       
        randomUserView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "randomUserCell")
    }
    
    func getRandomUsers() {
        ApiClient.getUsers { [weak self] (result) in
             switch result {
             case .failure:
                 break
             case .success(let users):
                self?.randomUsers = users
             }
         }
    }


}

extension RandomUserTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "randomUserCell", for: indexPath)
        let user = randomUsers[indexPath.row]
        cell.textLabel?.text = user.name.getFullName()
        print("printing user name \(user.name.getFullName())")
        return cell
    }
    
    
}
