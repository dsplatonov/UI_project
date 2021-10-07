//
//  AnimationOfImageViewController.swift
//  UI_project
//
//  Created by Дмитрий on 01.10.2021.
//

import UIKit

class AnimationOfImageViewController: UIViewController {

    @IBOutlet private var animationOfImageView: UIImageView!
    @IBOutlet private var viewForControl: UIView!
    @IBOutlet private var loadingAnimationView: UIView!
    @IBOutlet var loadingAnimation: LoadingAnimationView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.animationOfImageView.image = UIImage(named: "post1")
        self.loadingAnimationView.backgroundColor = .blue
        
    }
    
    private func animateOpacity(){
        let animationOfOpacity = CABasicAnimation(keyPath: "opacity")
        animationOfOpacity.beginTime = CACurrentMediaTime() + 1
        animationOfOpacity.duration = 1
        animationOfOpacity.fromValue = 0.5
        animationOfOpacity.toValue = 0
        animationOfOpacity.fillMode = .forwards
        animationOfOpacity.isRemovedOnCompletion = false
        self.loadingAnimationView.layer.add(animationOfOpacity, forKey: nil)
    }

    @IBAction func animateOpacityButtonPressed(_ sender: Any) {
        self.animateOpacity()
        
    }
    
}
