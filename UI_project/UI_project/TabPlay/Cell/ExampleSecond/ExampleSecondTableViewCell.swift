//
//  ExampleSecondTableViewCell.swift
//  ExampleSecondTableViewCell
//
//  Created by Дмитрий on 13.09.2021.
//

import UIKit

class ExampleSecondTableViewCell: UITableViewCell {

    @IBOutlet private weak var SecondLabel: UILabel!
    
    func configure(text: String){
        self.SecondLabel.text=text
    }
    
}
