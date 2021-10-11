//
//  SmoothViewController.swift
//  UI_project
//
//  Created by Дмитрий on 11.10.2021.
//

import UIKit

class SmoothViewController: UIViewController {
    
    @IBOutlet weak var smoothView: UIView!
    
    private var animator: PresentationAnimator!
    
    private lazy var controller: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .systemRed
        vc.transitioningDelegate = self
        return vc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.animator = .init(startFrame: self.smoothView.frame, destinationController: self.controller, sourceController: self)
    }
    
    @IBAction func smoothButtonPressed(_ sender: Any) {
        
        self.present(self.controller,animated: true)
        
    }
}

extension SmoothViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.animator
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.animator.hasStarted ? self.animator : nil
    }
    
}
