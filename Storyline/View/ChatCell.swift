//
//  ChatCell.swift
//  Storyline
//
//  Created by Mansoor Shah Said on 2018-01-27.
//  Copyright © 2018 Mansoor Shah Said. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var container: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupViews(name:String, profileUrl:String, message:String, bgColor:UIColor){
        self.profileNameLabel.text = name
        let url = URL(string: profileUrl)
        let data = try? Data(contentsOf: url!)
        profileImageView.image = UIImage(data: data!)
        messageLabel.text = message
        container.layer.cornerRadius = container.frame.height / 10
        container.backgroundColor = bgColor
        
    }
    
}
