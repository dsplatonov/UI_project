//
//  PresentationAnimator.swift
//  UI_project
//
//  Created by Дмитрий on 11.10.2021.
//

import UIKit

class PresentationAnimator: UIPercentDrivenInteractiveTransition, UIViewControllerAnimatedTransitioning {
    
    var hasStarted = false
    var shouldEnd = false
    let startFrame: CGRect
    private var destinationController: UIViewController
    private var sourceController: UIViewController
    
    init(startFrame: CGRect, destinationController: UIViewController, sourceController: UIViewController) {
        self.startFrame = startFrame
        self.destinationController = destinationController
        self.sourceController = sourceController
        super.init()
        self.setup()
    }
    
    private func setup() {
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(handle(_:)))
        self.sourceController.view.addGestureRecognizer(gesture)
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let destinationViewController = transitionContext.viewController(forKey: .to) else { return }
        guard let destinationView = destinationViewController.view else { return }
        destinationView.frame = self.startFrame
        transitionContext.containerView.addSubview(destinationView)
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext),
                       animations: {
            destinationView.frame = transitionContext.containerView.frame
        },
                       completion: { didCompleted in
            transitionContext.completeTransition(didCompleted)
        })
        
        
        
    }
    
    @objc private func handle(_ pan: UIPanGestureRecognizer) {
        self.hasStarted = true
        switch pan.state {
        case .began:
            self.sourceController.present(destinationController,animated: true)
            print(1)
        case .changed:
            
            let translation = abs(pan.translation(in: sourceController.view).y)
            let percent = (2 * translation)/sourceController.view.frame.height
            self.shouldEnd = percent > 0.5
            self.update(percent)
        case .ended:
            self.shouldEnd ? self.finish() : self.cancel()
            self.hasStarted = false
            print(3)
        case .cancelled:
            self.hasStarted = false
            self.cancel()
            print(4)
        default: break
            
        }
    }
    

}
