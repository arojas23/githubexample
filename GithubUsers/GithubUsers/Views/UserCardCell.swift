//
//  UserCardCell.swift
//  GithubUsers
//
//  Created by Alvaro Rojas  on 12/24/18.
//  Copyright © 2018 Alvaro Rojas . All rights reserved.
//

import Foundation
import UIKit
import Alamofire

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
        if(!urlImage.isEmpty) {
            Alamofire.request(urlImage).response { response in
                if let data = response.data {
                    let image = UIImage(data: data)
                    self.userProfileImageView.image = image
                } else {
                    print("Data is nil :(")
                }
            }
        }
    }
    
}
