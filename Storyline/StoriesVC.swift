//
//  StoriesVC.swift
//  Storyline
//
//  Created by Anthony Fiorito on 2018-01-27.
//  Copyright © 2018 Mansoor Shah Said. All rights reserved.
//

import UIKit

class StoriesVC: UIViewController {
    
    fileprivate static let storyCellIdentifier = "storyCell"

    fileprivate let storiesCollectionView: UICollectionView = {
        let scv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        scv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: storyCellIdentifier)
        scv.backgroundColor = .yellow
        return scv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello")
        
        setupSubviews()
        storiesCollectionView.layoutIfNeeded()
        print (storiesCollectionView.frame)
    }
    
    fileprivate func setupSubviews() {
        let layout = view.safeAreaLayoutGuide
        view.addSubview(storiesCollectionView)
        storiesCollectionView.topAnchor.constraint(equalTo: layout.topAnchor).isActive = true
        storiesCollectionView.leftAnchor.constraint(equalTo: layout.leftAnchor).isActive = true
        storiesCollectionView.rightAnchor.constraint(equalTo: layout.rightAnchor).isActive = true
        storiesCollectionView.bottomAnchor.constraint(equalTo: layout.bottomAnchor).isActive = true
        
    }

}

extension StoriesVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoriesVC.storyCellIdentifier, for: indexPath)
        cell.backgroundColor = .gray
        return cell
    }
    
    
}

extension StoriesVC: UICollectionViewDelegate {
    
}
