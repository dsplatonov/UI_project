//
//  NavigationAnimationViewController.swift
//  UI_project
//
//  Created by Дмитрий on 07.10.2021.
//

import UIKit

class NavigationAnimationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.delegate = self

    }
    

    @IBAction func returnButtonPressed(_ sender: Any) {

//        let viewController = CustomViewPresentViewController()
//        self.navigationController?.pushViewController(viewController, animated: true)
        
        
        print(self.navigationController?.viewControllers)
        if let viewController = self.navigationController?.viewControllers[0] {
            self.navigationController?.popToViewController(viewController, animated: true)
        }
        
        
    }
    

}

extension NavigationAnimationViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        switch operation {
        case .pop: return PopAnimator()
        case .push: return PushAnimator()
        default: return nil
        }
    }
}
