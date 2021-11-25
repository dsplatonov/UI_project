//
//  NewsTextTableViewCell.swift
//  UI_project
//
//  Created by Дмитрий on 24.11.2021.
//

import UIKit

class NewsTextTableViewCell: UITableViewCell {

    @IBOutlet private var newsTextLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureNewsText(newsText: String) {
        self.newsTextLabel.text = newsText
    }
    
}
