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
    let loadMoreCell = "LoadMoreCell"
    
    //UserList
    var userList:[JSON] = []
    var sinceQuery = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Registering User Custom Cell
        self.tableView.register(UserCardCell.self, forCellReuseIdentifier: self.userCardCell)
        self.tableView.register(UINib(nibName: "UserCardCell", bundle: nil), forCellReuseIdentifier: self.userCardCell)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.loadMoreCell)
        self.tableView.rowHeight = 100

        //getUsers
        self.getUsers(since: sinceQuery)
    }
    
    //Request to API -> We can move it to another place ... services.swift    
    func getUsers(since: Int = 0) {
        Alamofire.request("\(Constants.serverURL)/users?since\(since)", parameters:["since": since]).responseJSON { (response) -> Void in
            switch response.result {
            case .success(let value):
                let userListResponse = JSON(value).array
                self.userList += userListResponse ?? []
                
                //Preparing the Since value for the next query
                self.sinceQuery = self.sinceQuery + self.userList.count
                print(JSON(value))
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //Delegate Methods UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // this +1 is to add the ... Load More
        return userList.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == userList.count) {
            let loadMoreCell = self.tableView.dequeueReusableCell(withIdentifier: self.loadMoreCell)
            loadMoreCell?.textLabel?.text = "Load More..."
            return loadMoreCell!
        }
        
        let userCell = self.tableView.dequeueReusableCell(withIdentifier: userCardCell, for: indexPath) as! UserCardCell
        
        //Set Custom Cell with User values
        let user = self.userList[indexPath.row].dictionary!
        userCell.userNameProfileLabel.text = user["login"]?.stringValue
        userCell.userLinkProfileLabel.text = user["html_url"]?.stringValue
        userCell.setImageURL(user["avatar_url"]?.stringValue ?? "")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        userCell.onButtonTapped = {
            NSLog("App > Displaying RepositoriesView")
            let repositoriesViewController = storyboard.instantiateViewController(withIdentifier: "RepositoriesViewController") as! RepositoriesViewController
            self.navigationController?.pushViewController(repositoriesViewController, animated: true)
            
        }
        
        return userCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == userList.count) {
            self.getUsers(since: self.sinceQuery)
        }
    }

}
