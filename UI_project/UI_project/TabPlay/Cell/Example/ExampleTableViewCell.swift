//
//  ExampleTableViewCell.swift
//  ExampleTableViewCell
//
//  Created by Дмитрий on 13.09.2021.
//

import UIKit

class ExampleTableViewCell: UITableViewCell {

    @IBOutlet private weak var CellLabel: UILabel!
    @IBOutlet private weak var CellButton: UIButton!
    
    func configure(with item: testItem){
        self.CellLabel.text = item.textForLabel
        self.CellButton.setTitle("\(item.textForButton)", for: .normal)
        
    }
    
    
}

struct testItem {
    let textForLabel: String
    let textForButton: String
}

