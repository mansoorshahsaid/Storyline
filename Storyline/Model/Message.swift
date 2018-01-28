//
//  Message.swift
//  Storyline
//
//  Created by Mansoor Shah Said on 2018-01-27.
//  Copyright © 2018 Mansoor Shah Said. All rights reserved.
//

import Foundation
import UIKit

class Message{
    let userName:String!
    let pictureURL:String!
    let message:String!
    let bgColor:UIColor!
    
    init(userName:String, pictureURL:String, message:String) {
        self.userName = userName
        self.pictureURL = pictureURL
        self.message = message
        self.bgColor = UIColor.random
    }
}
