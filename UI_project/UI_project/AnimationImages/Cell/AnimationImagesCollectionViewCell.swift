//
//  AnimationImagesCollectionViewCell.swift
//  UI_project
//
//  Created by Дмитрий on 29.09.2021.
//

import UIKit

class AnimationImagesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var animationImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print(4)
    }
    
    func configure(name: String) {
        self.animationImageView.image = UIImage(named:name)
        
        
    }

}
