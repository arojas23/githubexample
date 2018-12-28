//
//  RepositoriesViewController.swift
//  GithubUsers
//
//  Created by Alvaro Rojas  on 12/24/18.
//  Copyright © 2018 Alvaro Rojas . All rights reserved.
//

import UIKit

class RepositoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    //Identifier Cell
    let repoCardCell = "RepoCardCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Registering Custom Cell
        self.tableView.register(RepoCardCell.self, forCellReuseIdentifier: self.repoCardCell)
        self.tableView.register(UINib(nibName: self.repoCardCell, bundle: nil), forCellReuseIdentifier: self.repoCardCell)
        self.tableView.rowHeight = 160
    }
    
    //Delegate Methods UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let repoCell = self.tableView.dequeueReusableCell(withIdentifier: self.repoCardCell, for: indexPath) as! RepoCardCell
        
        return repoCell
    }
}
