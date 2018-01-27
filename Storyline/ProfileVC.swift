//
//  ProfileVC.swift
//  Storyline
//
//  Created by Shameiz Rangwala on 2018-01-27.
//  Copyright © 2018 Mansoor Shah Said. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var ProfileStories: UITextField!
    @IBOutlet weak var ProfileUpvotes: UITextField!
    @IBOutlet weak var upImg: UIImageView!
    @IBOutlet weak var ProfileImg: UIImageView!
    @IBOutlet weak var ProfileName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ProfileImg.layer.cornerRadius = self.ProfileImg.frame.size.width/2;
        //self.ProfileImg.layer.shadowColor = #colorLiteral(red: 0.009499914944, green: 0.00950041879, blue: 0.009500147775, alpha: 1)
        //self.ProfileImg.layer.shadowRadius = 30
        self.ProfileImg.layer.borderWidth = 1.0;
        self.ProfileImg.layer.borderColor = #colorLiteral(red: 0.009499914944, green: 0.00950041879, blue: 0.009500147775, alpha: 1);
        self.ProfileImg.clipsToBounds = true
        ProfileName.text = "Shameiz Rangwala"
        ProfileName.borderStyle = UITextBorderStyle.none
        self.ProfileUpvotes.text = "25"
        self.ProfileStories.text = "33"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
