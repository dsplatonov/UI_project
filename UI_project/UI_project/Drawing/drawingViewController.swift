//
//  drawingViewController.swift
//  drawingViewController
//
//  Created by Дмитрий on 14.09.2021.
//

import UIKit

class drawingViewController:UIViewController {
    
    @IBOutlet private weak var drawingTableView: UITableView!
    var names:[String]=[]
    var charsForSection = [Character : Int]()
    var sortedCharsForSection:[Character]=[]
    var arrayForTableCell:[[String]]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.viewControllers[0].title = "Список друзей"
        self.drawingTableView.register(UINib(nibName: "DrawingTableViewCell", bundle: nil), forCellReuseIdentifier: Constants.Cell.drawing)
        self.getData()
    }
    
    private func getData(){
        var name: [String] = [
        "Абакумов",
        "Стоянов",
        "Абрикосов",
        "Пульц",
        "Бравир",
        "Щельцин",
        "Броневой",
        "Чеславлев",
        "Канторин",
        "Буханкин",
        "Рекомов",
        "Лампен",
        "Ящ"]
        name.sort()
        var characterInSection = [Character: Int]()
        var arrayForTable:[[String]]=[]
        
//        print(name[0].first!)
        var i:Int = 0
        var tmpArray:[String]=[]
        var tmpChar:Character = name[0].first!
        for index in name {
            let firstChar = index.first!
            if tmpChar != firstChar {
                i+=1
                tmpChar=firstChar
                arrayForTable.append(tmpArray)
                tmpArray = []
            }
            tmpArray.append(index)
            if let number = characterInSection[firstChar] {
                characterInSection[firstChar] = number + 1
            } else {
                characterInSection[firstChar] = 1
            }
        }
        if !tmpArray.isEmpty {
            arrayForTable.append(tmpArray)
            tmpArray=[]
        }
        
        print(characterInSection)
//        for index in characterInSection {
//            print(index.value)
//        }
        
        var charsSortedArray:[Character]=[]
        
        for index in characterInSection {
            charsSortedArray.append(index.key)
        }
        charsSortedArray.sort()
        print(charsSortedArray)
        
        
        print(arrayForTable)
        
        self.charsForSection=characterInSection
        self.sortedCharsForSection=charsSortedArray
        self.arrayForTableCell = arrayForTable
        self.names=name
    }
    
    private func presentPostController(indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "UserPost", bundle: nil)
        let viewController = storyBoard.instantiateInitialViewController()
        if let vc = viewController as? PostViewController {
            let userName = self.arrayForTableCell[indexPath.section][indexPath.row]
            vc.title = "Фото пользователя \(userName)"
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    
    
    
}

extension drawingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var i:Int = 0
        for index in sortedCharsForSection {
            if section == i {
                return charsForSection[index]!
            }
            i+=1
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return drawingTableView.dequeueReusableCell(withIdentifier: Constants.Cell.drawing, for: indexPath)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sortedCharsForSection.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var i:Int = 0
        for index in sortedCharsForSection {
            if section == i {
                return String(index)
            }
            i+=1
        }
        return "Title"
        }
    

    }
    

extension drawingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? DrawingTableViewCell)?.configure(
            drawLabel: arrayForTableCell[indexPath.section][indexPath.row],
            imageName: "\(indexPath.section),\(indexPath.row)")

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let selectedCell = self.drawingTableView.cellForRow(at: indexPath) as? DrawingTableViewCell
//        if let cell = selectedCell {
//            print(cell.getTextFromLabel())
//        }
        self.presentPostController(indexPath: indexPath)
    }
    
    
    
}
