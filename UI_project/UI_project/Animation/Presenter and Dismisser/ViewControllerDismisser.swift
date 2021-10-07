//
//  ViewControllerDismisser.swift
//  UI_project
//
//  Created by Дмитрий on 04.10.2021.
//

import UIKit

class ViewControllerDismisser: NSObject, UIViewControllerAnimatedTransitioning {
    
    let endFrame: CGRect
    
    init(endFrame: CGRect) {
        self.endFrame = endFrame
    }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from) else { return }
//        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        let containerViewFrame = transitionContext.containerView.frame
        
        let sourceViewTargetFrame = CGRect(x: 0, y: -containerViewFrame.height, width: source.view.frame.width, height: source.view.frame.height)
//        let destinationViewTargetFrame = source.view.frame
//
//        transitionContext.containerView.addSubview(destination.view)
//        destination.view.frame = CGRect(x: 0, y: destination.view.frame.height, width: source.view.frame.width, height: source.view.frame.height)
//
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, animations: {
            source.view.frame = sourceViewTargetFrame
//            destination.view.frame = destinationViewTargetFrame
        }, completion: { didcompleted in
//            source.removeFromParent()
            transitionContext.completeTransition(didcompleted)
        })
    }
    

}
