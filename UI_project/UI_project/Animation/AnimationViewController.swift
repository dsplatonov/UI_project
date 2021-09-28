//
//  AnimationViewController.swift
//  UI_project
//
//  Created by Дмитрий on 27.09.2021.
//

import UIKit

class AnimationViewController: UIViewController {


    @IBOutlet private var firstViewForLoadingAnimation: UIView!
    @IBOutlet private var secondViewForLoadingAnimation: UIView!
    @IBOutlet private var thirdViewForLoadingAnimation: UIView!
    @IBOutlet private var avatarView: avatarPushingAnimation!
    @IBOutlet private var avatarImageView: UIImageView!
    
    @IBOutlet var likeAnimationView: likeAnimation!
    @IBOutlet var likesCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstViewForLoadingAnimation.alpha = 0
        secondViewForLoadingAnimation.alpha = 0
        thirdViewForLoadingAnimation.alpha = 0
        let newMask = CAShapeLayer()
        let circlePath = UIBezierPath(ovalIn: .init(x: 0, y: 0, width: 50, height: 50))
        newMask.path = circlePath.cgPath
        self.avatarView.layer.mask = newMask
        
        self.likeAnimationView.likeAnimationLabel = self.likesCountLabel
        
    }

    @IBAction func animateLoadingButtonPressed(_ sender: Any) {
        UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.firstViewForLoadingAnimation.alpha = 1
        }, completion: { _ in
            UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
                self.firstViewForLoadingAnimation.alpha = 0
            })
        })
        UIView.animate(withDuration: 1, delay: 0.5, options: [.repeat, .autoreverse], animations: {
            self.secondViewForLoadingAnimation.alpha = 1
        }, completion: { _ in
            UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
                UIView.animate(withDuration: 1, animations: {
                    self.secondViewForLoadingAnimation.alpha = 0
                })
            })
        })
        UIView.animate(withDuration: 1, delay: 1, options: [.repeat, .autoreverse], animations: {
            self.thirdViewForLoadingAnimation.alpha = 1
        }, completion: { _ in
            UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .autoreverse], animations: {
                self.thirdViewForLoadingAnimation.alpha = 0
            })
        })
        
    }

    
}
