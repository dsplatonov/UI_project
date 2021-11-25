//
//  NewsPhotoTableViewCell.swift
//  UI_project
//
//  Created by Дмитрий on 24.11.2021.
//

import UIKit

class NewsPhotoTableViewCell: UITableViewCell {

    @IBOutlet private var newsImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(name: String) {
        self.newsImageView.image = UIImage(named: name)
    }
    
}
