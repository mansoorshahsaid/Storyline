//
//  StoryCollectionViewCell.swift
//  Storyline
//
//  Created by Anthony Fiorito on 2018-01-27.
//  Copyright © 2018 Mansoor Shah Said. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    let storyTitle: UILabel = {
        let st = UILabel()
        st.translatesAutoresizingMaskIntoConstraints = false
        st.text = "Walking in the Forest"
        
        return st
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    fileprivate func setupSubviews() {
        contentView.addSubview(storyTitle)
        storyTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        storyTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
    }
}
