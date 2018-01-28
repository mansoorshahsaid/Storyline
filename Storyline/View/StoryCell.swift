//
//  StoryCell.swift
//  Storyline
//
//  Created by Shameiz Rangwala on 2018-01-28.
//  Copyright © 2018 Mansoor Shah Said. All rights reserved.
//

import UIKit

class StoryCell: UITableViewCell {

    @IBOutlet weak var upvotes: UILabel!
    @IBOutlet weak var isActive: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
