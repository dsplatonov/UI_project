//
//  NewsAuthorAndDateTableViewCell.swift
//  UI_project
//
//  Created by Дмитрий on 24.11.2021.
//

import UIKit

class NewsAuthorAndDateTableViewCell: UITableViewCell {

    @IBOutlet private var AuthorLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(author: String, date: String) {
        self.AuthorLabel.text = author
        self.dateLabel.text = date
    }
    
}
