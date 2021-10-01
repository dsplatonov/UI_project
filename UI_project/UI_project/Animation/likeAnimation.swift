//
//  likeAnimation.swift
//  UI_project
//
//  Created by Дмитрий on 28.09.2021.
//

import UIKit

class likeAnimation: UIControl {
    
    var likeAnimationLabel = UILabel()
    var likesCount:Int = 1

    override var isHighlighted: Bool {
        willSet {
            labelAnimation(newValue)
        }
    }
    
    private func labelAnimation(_ state: Bool) {
        if state == true {
            UIView.transition(with: likeAnimationLabel,
                              duration: 1,
                              options: .transitionCrossDissolve,
                              animations: {
                self.likeAnimationLabel.text = String(self.likesCount)
            }, completion: { _ in
                self.likesCount += 1
            })
        }
    }

}
