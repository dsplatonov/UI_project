//
//  avatarPushingAnimation.swift
//  UI_project
//
//  Created by Дмитрий on 28.09.2021.
//

import UIKit

class avatarPushingAnimation: UIControl {
    
    override var isHighlighted: Bool {
        willSet {
                avatarAnimation(newValue)
        }
    }
    
    private func avatarAnimation(_ state: Bool) {
        UIView.animate(withDuration: 1, animations: {
            self.transform = .init(scaleX: 0.5, y: 0.5)
        }, completion: { _ in
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
                self.transform = .init(scaleX: 1.1, y: 1.1)
            })
        })
    }
}
