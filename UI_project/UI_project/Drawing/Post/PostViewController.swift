//
//  PostViewController.swift
//  UI_project
//
//  Created by Дмитрий on 17.09.2021.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet private var firstImageView: UIImageView!
    @IBOutlet private var secondImageView: UIImageView!
    @IBOutlet private var heartImageView: UIImageView!
    @IBOutlet private var likesLabel: UILabel!
    @IBOutlet private var likeControl: PostControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstImageView.image = UIImage(named: "post1")
        self.secondImageView.image = UIImage(named: "post2")
        self.heartImageView.image = UIImage(systemName: "heart")
        self.likeControl.likeButton = self.heartImageView
        self.likeControl.likes = self.likesLabel
        self.likeControl.liked = false
    }
}
