//
//  TabPlayViewController.swift
//  TabPlayViewController
//
//  Created by Дмитрий on 08.09.2021.
//

import UIKit

class TabPlayViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var items: [testItem] = []
    private var itemsForSecondCell:[String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "ExampleTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.Cell.example)
        self.tableView.register(UINib(nibName: "ExampleSecondTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.Cell.exampleSecond)
        self.getData()

    }
    
    private func getData() {
        let exampleItems: [testItem] = [
            .init(textForLabel: "Test Item 1", textForButton: "Wow Button 1"),
            .init(textForLabel: "Labellll", textForButton: "Wow 2"),
            .init(textForLabel: "What is next?", textForButton: "Don't push me")]
        
        let exampleItemsForSecondCell:[String] = [
        "Let's Continue our cells",
        "Okay, let's do it",
        "Wow",
        "Last row"]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.items = exampleItems
            self.itemsForSecondCell = exampleItemsForSecondCell
            self.tableView.reloadData()
        }
    }
    
    
//    из предыдущего ДЗ
//    @IBAction private func firstTabButtonPressed(_ sender: Any) {
//        self.tabBarController?.selectedIndex = 1
//    }
    
//    @IBAction private func returnButtonPressed(_ sender: Any) {
//        let storyBoard = UIStoryboard(name: "DebugMenu", bundle: nil)
//        let debugViewController = storyBoard.instantiateInitialViewController()
//        if let viewController = debugViewController as? DebugMenuViewController {
//            self.present(viewController, animated: true)
//        }
//
//    }
    
  
}

extension TabPlayViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.items.count
        } else {
            return self.itemsForSecondCell.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return tableView.dequeueReusableCell(withIdentifier: Constants.Cell.example, for: indexPath)
        } else {
            return tableView.dequeueReusableCell(withIdentifier: Constants.Cell.exampleSecond, for: indexPath)
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Section 1"
        } else {
            return "Section 2"
        }
    }
    
   func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       if section == 0 {
           return 40
       } else {
           return 20
       }
   }
}

extension TabPlayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            (cell as? ExampleTableViewCell)?.configure(with: self.items[indexPath.row])
        } else {
            (cell as? ExampleSecondTableViewCell)?.configure(text: self.itemsForSecondCell[indexPath.row])
        }
        
    }
}

