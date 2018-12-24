//
//  ViewController.swift
//  GithubUsers
//
//  Created by Alvaro Rojas  on 12/24/18.
//  Copyright © 2018 Alvaro Rojas . All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    
    //Identifier Cell
    let userCardCell = "UserCardCell"
    var userList:[JSON] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Registering User Custom Cell
        self.tableView.register(UserCardCell.self, forCellReuseIdentifier: self.userCardCell)
        self.tableView.register(UINib(nibName: "UserCardCell", bundle: nil), forCellReuseIdentifier: self.userCardCell)
        self.tableView.rowHeight = 100

        //getUsers
        self.getUsers()
    }
    
    //Request to API -> We can move it to another place ... services.swift
    
    func getUsers() {
        Alamofire.request("\(Constants.serverURL)/users").responseJSON { (response) -> Void in
            switch response.result {
            case .success(let value):
//                self.userList.append(JSON(value).array
                let userListResponse = JSON(value).array
                self.userList += userListResponse ?? []
                print(JSON(value))
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //Delegate Methods UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let userCell = tableView.dequeueReusableCell(withIdentifier: userCardCell) as! UserCardCell
        
        let user = self.userList[indexPath.row].dictionary!
        userCell.userNameProfileLabel.text = user["login"]?.stringValue
        userCell.userLinkProfileLabel.text = user["html_url"]?.stringValue
        userCell.setImageURL(user["avatar_url"]?.stringValue ?? "")
        
        return userCell
    }
    


}

