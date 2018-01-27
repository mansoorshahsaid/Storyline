//
//  ViewController.swift
//  Storyline
//
//  Created by Mansoor Shah Said on 2018-01-27.
//  Copyright © 2018 Mansoor Shah Said. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseGoogleAuthUI

class SignInVC: UIViewController, FUIAuthDelegate {

    
    let signInButton:UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = mainColor
        view.setTitle("Get in", for: .normal)
        view.setTitleColor(UIColor.black, for: .normal)
        view.addTarget(self, action: #selector(getIn), for: .touchUpInside)
        return view
    }()
    
    let authUI = FUIAuth.defaultAuthUI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authUI?.delegate = self
        let providers: [FUIAuthProvider] = [FUIGoogleAuth()]
        authUI?.providers = providers
        setupViews()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupViews(){
        self.view.addSubview(signInButton)
        signInButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        signInButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
    @objc func getIn(){
        let auth = FUIAuth.defaultAuthUI()?.providers.first as! FUIGoogleAuth
        auth.signIn(withDefaultValue: "", presenting: self) { (authCredential, error, result) in
            //
        }
    }

}

