//
//  PostControl.swift
//  UI_project
//
//  Created by Дмитрий on 20.09.2021.
//

import UIKit

class PostControl: UIControl {
    //передаём imageview из postViewController
    var likeButton = UIImageView()
    var likes = UILabel()
    var liked = false
    
    
    override var isHighlighted: Bool {
        willSet {
            likeControl(newValue)
        }
    }
    
    private func likeControl(_ state: Bool) {
         
         var countText = likes.text ?? String(0)
         var countInt = Int(countText)
         if state == true && liked == false {
             self.likeButton.image = UIImage(systemName: "heart.fill")
             self.liked = true
             countInt! += 1
             countText = String(countInt!)
             likes.text = countText
        } else if state == true && liked == true {
             self.likeButton.image = UIImage(systemName: "heart")
             self.liked = false
             countInt! -= 1
             countText = String(countInt!)
             likes.text = countText
         }
    }
    
}
