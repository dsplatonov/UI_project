//
//  ImageAnimation.swift
//  UI_project
//
//  Created by Дмитрий on 01.10.2021.
//

import UIKit

class ImageAnimation: UIControl {
    
    let imageForAnimation = UIImage()
    var stateOfAnimation = false

    override var isHighlighted: Bool {
        willSet {
            self.animateImage(newValue)
        }
    }
    
    func animateImage(_ state: Bool){
        if state == true && stateOfAnimation == false {
            UIView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                    self.transform = .init(scaleX: 1.3, y: 1.3)
                })
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                    self.center.x += 45
                })
            }, completion: { _ in
                self.stateOfAnimation = true
            })
            
//            UIView.animate(withDuration: 1, animations: {
//                self.transform = .init(scaleX: 1.2, y: 1.2)
//            }, completion: { _ in
//
//            })
        }
    }

}
