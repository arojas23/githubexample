//
//  UserCardCell.swift
//  GithubUsers
//
//  Created by Alvaro Rojas  on 12/24/18.
//  Copyright © 2018 Alvaro Rojas . All rights reserved.
//

import Foundation
import UIKit

class UserCardCell: UITableViewCell {
    
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var userNameProfileLabel: UILabel!
    @IBOutlet weak var userLinkProfileLabel: UILabel!
    @IBOutlet weak var userReposProfileLabel: UILabel!
    
    var onButtonTapped : (() -> Void)? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setImageURL(_ urlImage: String) {
        let url = URL(string: urlImage)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        self.userProfileImageView.image = UIImage(data: data!)
    }
    
}
