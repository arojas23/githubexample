//
//  RepoCardCell.swift
//  GithubUsers
//
//  Created by Alvaro Rojas  on 12/28/18.
//  Copyright © 2018 Alvaro Rojas . All rights reserved.
//

import UIKit
import SwiftyJSON

class RepoCardCell: UITableViewCell {
    
    @IBOutlet weak var githubRepoLinkText: UITextView!
    @IBOutlet weak var repoNameGithubText: UILabel!
    @IBOutlet weak var repoDescriptionGitHubText: UILabel!
    @IBOutlet weak var issuesCountText: UILabel!
    @IBOutlet weak var openIssuesCountText: UILabel!
    @IBOutlet weak var forkIssuesCountText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setValues(_ repoItem: JSON) {
        self.githubRepoLinkText.text = repoItem["clone_url"].stringValue
        self.repoNameGithubText.text = repoItem["name"].stringValue
        
        self.repoDescriptionGitHubText.text = repoItem["description"].stringValue
        let openIssues = repoItem["open_issues_count"].intValue
        let forkIssues = repoItem["forks_count"].intValue
        //        let totalIssues = openIssues + forkIssues
        self.openIssuesCountText.text = "Open Issues: \(openIssues)"
        self.forkIssuesCountText.text = "Forks: \(forkIssues)"
    }
}
