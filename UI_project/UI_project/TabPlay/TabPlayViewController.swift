//
//  TabPlayViewController.swift
//  TabPlayViewController
//
//  Created by Дмитрий on 08.09.2021.
//

import UIKit

class TabPlayViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction private func firstTabButtonPressed(_ sender: Any) {
        self.tabBarController?.selectedIndex = 1
    }
    
    @IBAction private func returnButtonPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "DebugMenu", bundle: nil)
        let debugViewController = storyBoard.instantiateInitialViewController()
        if let viewController = debugViewController as? DebugMenuViewController {
            self.present(viewController, animated: true)
        }
        
    }
    
  
}
