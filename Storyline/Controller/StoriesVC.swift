//
//  StoriesVC.swift
//  Storyline
//
//  Created by Anthony Fiorito on 2018-01-27.
//  Copyright © 2018 Mansoor Shah Said. All rights reserved.
//

import UIKit

class StoriesVC: UIViewController {
    
    fileprivate let storyCellIdentifier = "storyCell"

    fileprivate let storiesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let scv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        scv.translatesAutoresizingMaskIntoConstraints = false
        scv.backgroundColor = .yellow
        return scv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storiesCollectionView.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: storyCellIdentifier)
        storiesCollectionView.delegate = self
        storiesCollectionView.dataSource = self
        
        setupSubviews()
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: storyCellIdentifier, for: indexPath) as! StoryCollectionViewCell
        return cell
    }
    
    
}

extension StoriesVC: UICollectionViewDelegate {
    
}

extension StoriesVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
}
