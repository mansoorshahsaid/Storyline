//
//  AddStoryVC.swift
//  Storyline
//
//  Created by Shameiz Rangwala on 2018-01-27.
//  Copyright © 2018 Mansoor Shah Said. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddStoryVC: UIViewController {

    @IBOutlet weak var nameText: UITextField!
    let ref = Database.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()
        nameText.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addStory))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameText.resignFirstResponder()
    }
    
    @objc
    func addStory(){
        let uuid = UUID().uuidString
        ref.child("stories").child(uuid).setValue(["name":nameText.text ?? "","uuid":uuid,"userid":currentUserStoryline.uid,"username":currentUserStoryline.name,"isOpen":true])
        
        
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
