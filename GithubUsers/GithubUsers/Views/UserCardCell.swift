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

let imageCache = NSCache<NSString, UIImage>()
class UserCardCell: UITableViewCell {
    
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var userNameProfileLabel: UILabel!
    @IBOutlet weak var userLinkProfileLabel: UITextView!
    @IBOutlet weak var userReposProfileLabel: UILabel!
    
    var onButtonTapped : (() -> Void)? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setImageURL(_ urlImage: String) {
        if(!urlImage.isEmpty) {
            if let image = imageCache.object(forKey: NSString(string: urlImage)) {
                self.userProfileImageView.image = image
                return
            }
            Alamofire.request(urlImage).response { response in
                if let data = response.data {
                    let image = UIImage(data: data)
                    self.userProfileImageView.image = image
                    imageCache.setObject(image!, forKey: NSString(string: urlImage))

                } else {
                    print("Data is nil :(")
                }
            }
        }
    }
    
}
