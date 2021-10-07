//
//  ViewControllerPresenter.swift
//  UI_project
//
//  Created by Дмитрий on 04.10.2021.
//

import UIKit

class ViewControllerPresenter: NSObject, UIViewControllerAnimatedTransitioning {
    
    let startFrame: CGRect
    
    init(startFrame: CGRect) {
        self.startFrame = startFrame
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        let containerViewFrame = transitionContext.containerView.frame
        let sourceViewTargetFrame = CGRect(x: 0, y: -containerViewFrame.height, width: source.view.frame.width, height: source.view.frame.height)
        let destinationViewTargetFrame = source.view.frame
        
        transitionContext.containerView.addSubview(destination.view)
        
        destination.view.frame = CGRect(x: 0, y: containerViewFrame.height, width: source.view.frame.width, height: source.view.frame.height)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
//            source.view.frame = sourceViewTargetFrame
            destination.view.frame = destinationViewTargetFrame
        }, completion: { finished in
//            source.removeFromParent()
            transitionContext.completeTransition(finished)
        })
        
//        guard let toView = transitionContext.viewController(forKey: .to)?.view else { return }
//
//        toView.frame = self.startFrame
//        transitionContext.containerView.addSubview(toView)
//
//        let duration = transitionDuration(using: transitionContext)
//
//        UIView.animate(withDuration: duration, animations: {
//            toView.frame = transitionContext.containerView.frame
//        }, completion: { didcompleted in
//            transitionContext.completeTransition(didcompleted)
//        })
        
        
        
    }
    
    


}
