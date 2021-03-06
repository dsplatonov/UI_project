//
//  DebugMenuViewController.swift
//  DebugMenuViewController
//
//  Created by Дмитрий on 08.09.2021.
//

import UIKit
import Firebase

class DebugMenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Testing reading from Firebase database
        let ref = Database.database().reference().child("Users/id")
        ref.getData(completion: { error, snapshot in
            guard error == nil else {
                debugPrint(error!.localizedDescription)
                return
            }
            debugPrint("Database Snapshot: \(snapshot.value as? String)")
        })
        
    }
    
    
    @IBAction private func tabButtonPressed(_ sender: Any) {
        //self.showTabScene()
        print(1)
        
        let storyBoard = UIStoryboard(name: "TabPlay", bundle: nil)
        let tabPlayViewController = storyBoard.instantiateInitialViewController()
        tabPlayViewController?.modalPresentationStyle = .fullScreen
        
        if let tabViewController = tabPlayViewController {
            print(2)
            self.present(tabViewController, animated: true)
        
        }
    }
    
    @IBAction func navigationButtonPressed(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Navigation", bundle: nil)
        let navigationViewController = storyBoard.instantiateInitialViewController()
        navigationViewController?.modalPresentationStyle = .overFullScreen
        if let viewController = navigationViewController {
            self.present(viewController, animated: true)
        }
        
        
    }
    
    func switchToStoryboard(Storyboard:String) {
        let storyboard = UIStoryboard(name:Storyboard, bundle: nil)
        let changeToViewController = storyboard.instantiateInitialViewController()
        changeToViewController?.modalPresentationStyle = .fullScreen
        if let viewController = changeToViewController {
            self.present(viewController, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func drawingButtonPressed(_ sender: Any) {
        switchToStoryboard(Storyboard: "Drawing")
        
    }
    

    @IBAction func animationButtonPressed(_ sender: Any) {
        switchToStoryboard(Storyboard: "Animation")
    }
    
    @IBAction func loginToVkButtonPressed(_ sender: Any) {
        switchToStoryboard(Storyboard: "LoginToVk")
    }
    
    
}
