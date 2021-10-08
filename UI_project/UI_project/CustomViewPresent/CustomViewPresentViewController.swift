//
//  CustomViewPresentViewController.swift
//  UI_project
//
//  Created by Дмитрий on 04.10.2021.
//

import UIKit

class CustomViewPresentViewController: UIViewController {
    
    let animationVC = AnimationViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func returnViewButtonPressed(_ sender: Any) {
//        let storyBoard = UIStoryboard.init(name: "Animation", bundle: nil)
//        let viewController = storyBoard.instantiateInitialViewController()
//        viewController?.transitioningDelegate = AnimationViewController()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func navigationAnimationButtonPressed(_ sender: Any) {
        let vc = NavigationAnimationViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
//        if let navigationAnimationViewController = self.navigationController?.viewControllers[0] {
//            self.navigationController?.popToViewController(navigationAnimationViewController, animated: true)
//        }
        
    }
    
    

}
