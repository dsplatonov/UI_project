//
//  secondTabViewController.swift
//  secondTabViewController
//
//  Created by Дмитрий on 09.09.2021.
//

import UIKit

class secondTabViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func secondButtonePressed(_ sender: Any) {
        
        self.tabBarController?.selectedIndex = 2
        
    }
    
}
