//
//  thirdTabViewController.swift
//  thirdTabViewController
//
//  Created by Дмитрий on 09.09.2021.
//

import UIKit

class thirdTabViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func thirdButtonPressed(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
    
}
