//
//  PushAnimator.swift
//  UI_project
//
//  Created by Дмитрий on 07.10.2021.
//

import UIKit

class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        let containerViewFrame = transitionContext.containerView.frame
        let sourceViewTargetFrame = CGRect(x: 0, y: -containerViewFrame.height, width: source.view.frame.width, height: source.view.frame.height)
        let destinationViewTargetFrame = source.view.frame
        
        transitionContext.containerView.addSubview(destination.view)
        
        destination.view.frame = CGRect(x: 0, y: containerViewFrame.height, width: source.view.frame.width, height: source.view.frame.height)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            source.view.frame = sourceViewTargetFrame
            destination.view.frame = destinationViewTargetFrame
        }, completion: { didCompleted in
            source.removeFromParent()
            transitionContext.completeTransition(didCompleted)
        })
        
    }
    

}
