//
//  RepoCardCell.swift
//  GithubUsers
//
//  Created by Alvaro Rojas  on 12/28/18.
//  Copyright © 2018 Alvaro Rojas . All rights reserved.
//

import UIKit

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
}
