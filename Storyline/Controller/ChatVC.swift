//
//  ChatVC.swift
//  Storyline
//
//  Created by Mansoor Shah Said on 2018-01-27.
//  Copyright © 2018 Mansoor Shah Said. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ChatVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputTextField: UITextView!
    @IBOutlet weak var buttonSend: UIButton!
    
    var messages = [Message]()
    let ref = Database.database().reference()
    var storyID:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonSend.backgroundColor = mainTextColor
        buttonSend.layer.cornerRadius = buttonSend.frame.height / 2
        
        let nibName = UINib(nibName: "ChatCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "cell")
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 100;
        
        ref.child("messages").child(storyID).observe(.childAdded) { (snapshot) in
            if let value = snapshot.value as? NSDictionary{
                var name = value["name"] as? String ?? ""
                name = name.components(separatedBy: " ").first!
                let pictureURL = value["profileURL"] as? String ?? ""
                let message = value["message"] as? String ?? ""
                let newMessage = Message(userName: name, pictureURL: pictureURL, message: message)
                self.messages.append(newMessage)
                self.tableView.reloadData()
                self.scrollToBottom()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChatCell
        let message = messages[indexPath.row]
        cell.setupViews(name: message.userName, profileUrl: message.pictureURL, message: message.message, bgColor: message.bgColor)
        return cell
    }

    @IBAction func sendAction(_ sender: Any) {
        let uid = currentUserStoryline.uid
        let name = currentUserStoryline.name
        let profileURL = currentUserStoryline.imageUrl
        let message = inputTextField.text
        let storyID = self.storyID
        
        self.ref.child("messages").child(storyID!).childByAutoId().setValue(["uid": uid, "name": name, "profileURL": profileURL, "message": message, "storyID": storyID])
        inputTextField.text = ""
    }
    
    func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.messages.count-1, section: 0)
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
            self.tableView.contentInset.bottom = 0
        }
    }
    

}
