//
//  thirdNavigationViewController.swift
//  thirdNavigationViewController
//
//  Created by Дмитрий on 09.09.2021.
//

import UIKit

class thirdNavigationViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction private func thirdNavButtonPressed(_ sender: Any) {

        if let viewController = self.navigationController?.viewControllers[0] {
            self.navigationController?.popToViewController(viewController, animated: true)
        }
        
    }
    
}
