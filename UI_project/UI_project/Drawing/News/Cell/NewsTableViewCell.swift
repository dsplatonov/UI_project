//
//  NewsTableViewCell.swift
//  UI_project
//
//  Created by Дмитрий on 23.09.2021.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    let newsUserAvatar = UIImageView()
    let newsNameLabel = UILabel()
    let newsDateLabel = UILabel()
    let newsTextField = UILabel()
    let newsImageView = UIImageView()
    var viewsCountLabel = UILabel()
    let viewsCountImageView = UIImageView()
    var likesCountLabel = UILabel()
    let likesCountImageView = UIImageView()
    
    func configureNewsCell(with item:NewsPost){
        newsUserAvatar.translatesAutoresizingMaskIntoConstraints = false
        newsNameLabel.translatesAutoresizingMaskIntoConstraints = false
        newsDateLabel.translatesAutoresizingMaskIntoConstraints = false
        newsTextField.translatesAutoresizingMaskIntoConstraints = false
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        viewsCountLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsCountImageView.translatesAutoresizingMaskIntoConstraints = false
        likesCountLabel.translatesAutoresizingMaskIntoConstraints = false
        likesCountImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(newsUserAvatar)
        contentView.addSubview(newsNameLabel)
        contentView.addSubview(newsDateLabel)
        contentView.addSubview(newsTextField)
        contentView.addSubview(newsImageView)
        contentView.addSubview(viewsCountLabel)
        contentView.addSubview(viewsCountImageView)
        contentView.addSubview(likesCountLabel)
        contentView.addSubview(likesCountImageView)
        
        
        
        self.newsUserAvatar.image = UIImage(named: item.userAvatarImageName)
        self.newsNameLabel.text = item.userName
        self.newsDateLabel.text = item.dateOfThePost
        self.newsTextField.text = item.textOfThePost
//        self.newsTextField.adjustsFontSizeToFitWidth = true
        self.newsTextField.minimumScaleFactor = 0.5
        self.newsTextField.numberOfLines = 0
        self.newsImageView.image = UIImage(named: item.postImageName)
        self.newsImageView.contentMode = .scaleToFill
        self.viewsCountLabel.text = String(item.viewsCount)
        self.viewsCountImageView.image = UIImage(systemName: "eye.fill")
        self.viewsCountImageView.contentMode = .scaleToFill
        self.likesCountLabel.text = String(item.likesCount)
        self.likesCountImageView.image = UIImage(systemName: "hand.thumbsup.fill")
        
        NSLayoutConstraint.activate([
            newsUserAvatar.widthAnchor.constraint(equalToConstant: 50),
            newsUserAvatar.heightAnchor.constraint(equalToConstant: 50),
            newsUserAvatar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            newsUserAvatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            
            newsNameLabel.leadingAnchor.constraint(equalTo: newsUserAvatar.trailingAnchor, constant: 10),
            newsNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),

            
            newsDateLabel.leadingAnchor.constraint(equalTo: newsUserAvatar.trailingAnchor, constant: 10),
            newsDateLabel.topAnchor.constraint(equalTo: newsNameLabel.bottomAnchor, constant: 10),
            
            newsTextField.topAnchor.constraint(equalTo: newsUserAvatar.bottomAnchor, constant: 10),
            newsTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            newsTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            newsImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            newsImageView.topAnchor.constraint(equalTo: newsTextField.bottomAnchor, constant: 10),
            newsImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            newsImageView.heightAnchor.constraint(equalToConstant: 300),
            
            viewsCountImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewsCountImageView.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 10),
            
            viewsCountLabel.leadingAnchor.constraint(equalTo: viewsCountImageView.trailingAnchor, constant: 10),
            viewsCountLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 10),

            
            likesCountImageView.leadingAnchor.constraint(equalTo: viewsCountLabel.trailingAnchor, constant: 40),
            likesCountImageView.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 10),

            
            likesCountLabel.leadingAnchor.constraint(equalTo: likesCountImageView.trailingAnchor, constant: 10),
            likesCountLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: 10)
        ])
        self.updateConstraints()
//        var height = NSLayoutConstraint.Attribute.height.rawValue
//        print(height)
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure thezview for the selected state
    }
    
}

struct NewsPost {
    let userAvatarImageName: String
    let userName: String
    let dateOfThePost: String
    let textOfThePost: String
    let postImageName: String
    var viewsCount: Int
    var likesCount: Int
}
