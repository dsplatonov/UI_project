//
//  NewsLikesAndCommentsTableViewCell.swift
//  UI_project
//
//  Created by Дмитрий on 24.11.2021.
//

import UIKit

class NewsLikesAndCommentsTableViewCell: UITableViewCell {

    @IBOutlet private var likesLabel: UILabel!
    @IBOutlet private var commentsLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(likes: Int, comments: Int) {
        self.likesLabel.text = String(likes)
        self.commentsLabel.text = String(comments)
    }
    
}
