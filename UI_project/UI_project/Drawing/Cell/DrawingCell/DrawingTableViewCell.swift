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
    }
    
    

    
        
    
    

    
}
