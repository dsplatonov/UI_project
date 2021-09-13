//
//  secondTabViewController.swift
//  secondTabViewController
//
//  Created by Дмитрий on 09.09.2021.
//

import UIKit

class secondTabViewController: UIViewController {
    
    @IBOutlet private weak var CollectionView: UICollectionView!
    
    private var items:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.register(UINib(nibName: "ExampleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constants.Cell.exampleCollection)
        self.getData()
    }
    
    private func getData(){
        let testStrings:[String] = [
        "Testing",
        "Collection",
        "Label"]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.items = testStrings
            self.CollectionView.reloadData()
        }
    }
    
    
    
    
//  Из предыдущего ДЗ
//    @IBAction private func secondButtonePressed(_ sender: Any) {
//
//        self.tabBarController?.selectedIndex = 2
//
//    }
    
}

extension secondTabViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Cell.exampleCollection, for: indexPath)
    }
    
    
    
    
}

extension secondTabViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as? ExampleCollectionViewCell)?.configure(textForLabel: items[indexPath.row])
    }
}

extension secondTabViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height:CGFloat = 150
        let rows:CGFloat = 4
        let inset:CGFloat = 20
        let totalInset = inset * 2
        let contentSize = self.CollectionView.frame.width - totalInset
        let rowWidth = contentSize/rows
        
        return .init(width: rowWidth, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

