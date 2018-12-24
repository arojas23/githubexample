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
    let userList:[JSON] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Alamofire.request("\(Constants.serverURL)/users").responseJSON { (response) -> Void in
            print(response)
            self.tableView.reloadData()
        }
        
        //Registering User Custom Cell
        self.tableView.register(UserCardCell.self, forCellReuseIdentifier: self.userCardCell)
        self.tableView.register(UINib(nibName: "UserCardCell", bundle: nil), forCellReuseIdentifier: self.userCardCell)
        self.tableView.rowHeight = 100

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let userCell = tableView.dequeueReusableCell(withIdentifier: userCardCell) as! UserCardCell
        userCell.userNameProfileLabel.text = "ALVARO ROJAS"
        
        return userCell
    }
    


}

