//
//  ProfileVC.swift
//  Storyline
//
//  Created by Shameiz Rangwala on 2018-01-27.
//  Copyright © 2018 Mansoor Shah Said. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var ProfileImg: UIImageView!
    @IBOutlet weak var ProfileEmail: UITextField!
    @IBOutlet weak var ProfileName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ProfileImg.layer.cornerRadius = self.ProfileImg.frame.size.width/2;
        self.ProfileImg.clipsToBounds = true
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
