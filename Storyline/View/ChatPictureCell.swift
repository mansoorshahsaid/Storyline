//
//  ChatPictureCell.swift
//  Storyline
//
//  Created by Mansoor Shah Said on 2018-01-28.
//  Copyright © 2018 Mansoor Shah Said. All rights reserved.
//

import UIKit
import SDWebImage

class ChatPictureCell: UITableViewCell {
    @IBOutlet weak var profilePictureImgView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var messagePictureImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupViews(profileName:String, profileImgURL:String, messageImgURL:String){
        profileNameLabel.text = profileName
        profilePictureImgView.layer.cornerRadius = profilePictureImgView.frame.height / 2
        profilePictureImgView.sd_setImage(with: URL(string: profileImgURL), completed: nil)
        messagePictureImgView.sd_setImage(with: URL(string: messageImgURL), completed: nil)
    }
    
    
    
}
