//
//  DrawingTableViewCell.swift
//  DrawingTableViewCell
//
//  Created by Дмитрий on 14.09.2021.
//

import UIKit

class DrawingTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var NameLabelText: UILabel!
    @IBOutlet private weak var ViewForImage: drawView!
    @IBOutlet private var ImageView: UIImageView!
    
    
    func configure(drawLabel:String, imageName:String){
        self.NameLabelText.text=drawLabel
        self.ImageView.image = UIImage(named: imageName)
        self.ImageView.layer.shadowRadius = 2
        self.ImageView.layer.shadowColor = UIColor.black.cgColor
        self.ImageView.layer.shadowOffset = .init(width: 10, height: -10)
        self.ImageView.layer.shadowOpacity = 0.5
    }
    
    func getTextFromLabel() -> String? {
        if let text = self.NameLabelText.text {
            return text
        } else {
            return nil
        }
    }
    
}
