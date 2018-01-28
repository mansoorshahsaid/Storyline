//
//  AddStoryVC.swift
//  Storyline
//
//  Created by Shameiz Rangwala on 2018-01-27.
//  Copyright © 2018 Mansoor Shah Said. All rights reserved.
//

import UIKit
import FirebaseDatabase

protocol GotoStoryDelegate {
    func goToStory(str:String)
}

class AddStoryVC: UIViewController {
    
    var storyDelegate: GotoStoryDelegate?
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var newStoryImage: UIImageView!
    let ref = Database.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.delegate = self
        newStoryImage.tintColor = mainTextColor
        
        let top = CALayer()
        top.backgroundColor = secondaryTextColor.cgColor
        top.frame = CGRect(x: 0.0, y: 0.0, width: self.nameText.bounds.width, height: 1.0)
        self.nameText.layer.addSublayer(top)
        
        let bottom = CALayer()
        bottom.backgroundColor = secondaryTextColor.cgColor
        bottom.frame = CGRect(x: 0.0, y: self.nameText.bounds.height - 1, width: self.nameText.bounds.width, height: 1.0)
        self.nameText.layer.addSublayer(bottom)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true) {
            
        }
    }
    @IBAction func addStory(_ sender: Any) {
        let uuid = UUID().uuidString
        ref.child("stories").child(uuid).setValue([
            "name": nameText.text ?? "",
            "uuid": uuid,
            "userid": currentUserStoryline.uid,
            "username": currentUserStoryline.name,
            "userImage": currentUserStoryline.imageUrl,
            "upvotes": 0,
            "isOpen":true
            ])
        let chatVC = ChatVC()
        chatVC.storyID = uuid
        
        self.dismiss(animated: true) {
            self.storyDelegate?.goToStory(str:uuid)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameText.resignFirstResponder()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AddStoryVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
