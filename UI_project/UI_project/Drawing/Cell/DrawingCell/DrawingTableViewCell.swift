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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.ViewForImage.layer.shadowPath = UIBezierPath(ovalIn: self.ViewForImage.bounds).cgPath
    }
    
    func configure(drawLabel:String, imageName:String){
        self.NameLabelText.text=drawLabel
        self.ImageView.image = UIImage(named: imageName)
        let newMask = CAShapeLayer()
        let circlePath = UIBezierPath(ovalIn: .init(x: 0, y: 0, width: 50, height: 50))
        newMask.path = circlePath.cgPath
        self.ImageView.layer.mask = newMask
        self.ViewForImage.layer.shadowColor = UIColor.black.cgColor
        self.ViewForImage.layer.shadowOffset = .zero
        self.ViewForImage.layer.shadowRadius = 5
        self.ViewForImage.layer.shadowOpacity = 0.75
        self.ViewForImage.backgroundColor = .clear
        
        
    }
    
    func getTextFromLabel() -> String? {
        if let text = self.NameLabelText.text {
            return text
        } else {
            return nil
        }
    }
    
}
