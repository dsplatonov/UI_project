//
//  AnimationImagesViewController.swift
//  UI_project
//
//  Created by Дмитрий on 29.09.2021.
//

import UIKit

class AnimationImagesViewController: UIViewController {

    @IBOutlet var animationImagesCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationImagesCollectionView.register(UINib(nibName: "AnimationImagesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AnimationImages")
    }
    


}

extension AnimationImagesViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return animationImagesCollectionView.dequeueReusableCell(withReuseIdentifier: "AnimationImages", for: indexPath)

    }


}

extension AnimationImagesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        print(1)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as! AnimationImagesCollectionViewCell).configure(name: "post\(indexPath.row+1)")
        print("post\(indexPath.row)")
    }
    
    
}

extension AnimationImagesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: 100)
    }
}
