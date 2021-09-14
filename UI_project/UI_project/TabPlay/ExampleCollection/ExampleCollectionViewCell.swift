//
//  ExampleCollectionViewCell.swift
//  ExampleCollectionViewCell
//
//  Created by Дмитрий on 13.09.2021.
//

import UIKit

class ExampleCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var CollectionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(textForLabel:String){
        self.CollectionLabel.text = textForLabel
    }

}



