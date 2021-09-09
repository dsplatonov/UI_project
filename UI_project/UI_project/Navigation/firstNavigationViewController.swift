//
//  firstNavigationViewController.swift
//  firstNavigationViewController
//
//  Created by Дмитрий on 09.09.2021.
//

import UIKit

class firstNavigationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    @IBAction private func returnButtonPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "DebugMenu", bundle: nil)
        let debugViewController = storyBoard.instantiateInitialViewController()
        debugViewController?.modalPresentationStyle = .fullScreen
        if let viewController = debugViewController as? DebugMenuViewController {
            self.present(viewController, animated: true, completion: nil)
        }
    }
    

    
}
