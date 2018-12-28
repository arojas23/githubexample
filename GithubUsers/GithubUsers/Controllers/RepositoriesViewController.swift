//
//  RepositoriesViewController.swift
//  GithubUsers
//
//  Created by Alvaro Rojas  on 12/24/18.
//  Copyright © 2018 Alvaro Rojas . All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RepositoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    //RepoURL var
    var repoUrl = ""
    var repoListItems:[JSON] = []
    
    //Identifier Cell
    let repoCardCell = "RepoCardCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSLog("API > Calling Repo URL: \(self.repoUrl)")
        self.getReposList(page: 1, per_page: 5)
        
        //Registering Custom Cell
        self.tableView.register(RepoCardCell.self, forCellReuseIdentifier: self.repoCardCell)
        self.tableView.register(UINib(nibName: self.repoCardCell, bundle: nil), forCellReuseIdentifier: self.repoCardCell)
        self.tableView.rowHeight = 160
    }
    
    //Request to API -> We can move it to another place ... services.swift !!!!
    func getReposList(page: Int = 1, per_page: Int = 10) {
        if(!self.repoUrl.isEmpty) {
            Alamofire.request(self.repoUrl, parameters:["page": page, "per_page": per_page])
            .responseJSON { (response) -> Void in
                switch response.result{
                case .success(let value) :
                    let repoListResponse = JSON(value).array
                    self.repoListItems += repoListResponse ?? []
                    print(JSON(value))
                    self.tableView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    //Delegate Methods UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repoListItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let repoCell = self.tableView.dequeueReusableCell(withIdentifier: self.repoCardCell, for: indexPath) as! RepoCardCell
        
        let repoItem = self.repoListItems[indexPath.row]
        
        //Set values to Cell
        repoCell.githubRepoLinkText.text = repoItem["owner"].null != nil ? "" : repoItem["owner"]["html_url"].stringValue
        repoCell.repoNameGithubText.text = repoItem["name"].stringValue
        
        repoCell.repoDescriptionGitHubText.text = repoItem["description"].stringValue
        repoCell.issuesCountText.text = "Issues: \(repoItem[""].stringValue)"
        repoCell.openIssuesCountText.text = "Open Issues: \(repoItem["open_issues_count"].stringValue)"
        repoCell.forkIssuesCountText.text = "Fork Issues: \(repoItem["forks_count"].stringValue)"
        
        return repoCell
    }
}
