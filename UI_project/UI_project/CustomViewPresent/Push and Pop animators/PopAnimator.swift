//
//  PopAnimator.swift
//  UI_project
//
//  Created by Дмитрий on 07.10.2021.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        print(10)
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        let containerViewFrame = transitionContext.containerView.frame
        
        let sourceViewTargetFrame = CGRect(x: -containerViewFrame.width, y: -containerViewFrame.height, width: source.view.frame.width, height: source.view.frame.height)
        let destinationViewTargetFrame = source.view.frame
        
        transitionContext.containerView.addSubview(destination.view)
        
        destination.view.frame = CGRect(x: containerViewFrame.width, y: containerViewFrame.height, width: source.view.frame.width, height: source.view.frame.height)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            source.view.frame = sourceViewTargetFrame
            destination.view.frame = destinationViewTargetFrame
        }, completion: { didcompleted in
            source.removeFromParent()
            transitionContext.completeTransition(didcompleted)
        })
        
    }
    

}
