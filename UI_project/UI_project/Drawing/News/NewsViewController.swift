//
//  NewsViewController.swift
//  UI_project
//
//  Created by Дмитрий on 23.09.2021.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet private var newsTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsTable.dataSource = self
        self.newsTable.delegate = self
        self.newsTable.register(Constants.Nib.news, forCellReuseIdentifier: Constants.Cell.news)
        

    }
    



}


extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return newsTable.dequeueReusableCell(withIdentifier: Constants.Cell.news, for: indexPath)
    }
    
    
}

extension NewsViewController: UITableViewDelegate {
    
}
