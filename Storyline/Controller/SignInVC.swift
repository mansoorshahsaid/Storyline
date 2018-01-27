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
import FirebaseDatabase

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
    
    let ref = Database.database().reference()
    
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
        let authViewController = authUI!.authViewController()
        self.present(authViewController, animated: true, completion: nil)
//        let auth = FUIAuth.defaultAuthUI()?.providers.first as! FUIGoogleAuth
//        auth.signIn(withDefaultValue: "", presenting: self, completion: nil)
    }
    
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if (error != nil){
            print("cannot log in")
            return
        }
        
        guard let user = authDataResult?.user else {
            return
        }
        
        var uid = user.uid
        var storiesCount = 0
        var upVoteCount =  0
        var name = user.displayName!
        var photoURL = user.photoURL!.absoluteString
        
        let userID = user.uid
        ref.child("users").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            if let value = snapshot.value as? NSDictionary {
                uid = value["uid"] as? String ?? ""
                name = value["name"] as? String ?? ""
                photoURL = value["photoURL"] as? String ?? ""
                storiesCount = value["storiesCount"] as? Int ?? 0
                upVoteCount =  value["upVoteCount"] as? Int ?? 0
                currentUserStoryline = UserStoryline(uid: uid, imageUrl: photoURL, name: name, storiesCount: storiesCount, upVoteCount: upVoteCount)
            } else {
                self.ref.child("users").child(user.uid).setValue(["uid":uid, "name":name, "photoURL":photoURL, "storiesCount": storiesCount, "upVoteCount":upVoteCount])
                currentUserStoryline = UserStoryline(uid: uid, imageUrl: photoURL, name: name, storiesCount: storiesCount, upVoteCount: upVoteCount)
            }
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
        self.navigationController?.present(StoriesVC(), animated: true, completion: nil)
        
        
        
    }

}

