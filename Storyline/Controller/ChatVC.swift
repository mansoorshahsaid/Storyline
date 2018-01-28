//
//  ChatVC.swift
//  Storyline
//
//  Created by Mansoor Shah Said on 2018-01-27.
//  Copyright © 2018 Mansoor Shah Said. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ChatVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var inputTextField: UITextView!
    @IBOutlet weak var buttonSend: UIButton!

    @IBOutlet weak var textfieldBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var textfieldTopConstraint: NSLayoutConstraint!
    
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
        
        self.inputTextField.delegate = self
        
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
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardNotification(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillChangeFrame,
                                               object: nil)
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
        if (inputTextField.text == ""){
            return
        }
        
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
    
    @objc func keyboardNotification(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let endFrameY = endFrame?.origin.y ?? 0
            let duration:TimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIViewAnimationOptions.curveEaseInOut.rawValue
            let animationCurve:UIViewAnimationOptions = UIViewAnimationOptions(rawValue: animationCurveRaw)
            if endFrameY >= UIScreen.main.bounds.size.height {
                self.textfieldBottomConstraint?.constant = 0.0
            } else {
                self.textfieldBottomConstraint?.constant = endFrame?.size.height ?? 0.0
                scrollToBottom()
            }
            UIView.animate(withDuration: duration,
                           delay: TimeInterval(0),
                           options: animationCurve,
                           animations: { self.view.layoutIfNeeded() },
                           completion: nil)
        }
    }

    

}
