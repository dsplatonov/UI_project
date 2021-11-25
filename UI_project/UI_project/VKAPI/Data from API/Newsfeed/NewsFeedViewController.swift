//
//  NewsFeedViewController.swift
//  UI_project
//
//  Created by Дмитрий on 24.11.2021.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet private var newsFeedTableView: UITableView!
    private var newsFeedService = NewsfeedAPI()
    private var news: [News] = []
    
    private enum NewsFeedContents {
        case text
        case photo
        case author
        case likes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.getData()
        
        self.newsFeedTableView.register(UINib(nibName: "NewsTextTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTextTableViewCell")
        self.newsFeedTableView.register(UINib(nibName: "NewsPhotoTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsPhotoTableViewCell")
        self.newsFeedTableView.register(UINib(nibName: "NewsAuthorAndDateTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsAuthorAndDateTableViewCell")
        self.newsFeedTableView.register(UINib(nibName: "NewsLikesAndCommentsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsLikesAndCommentsTableViewCell")

        self.newsFeedTableView.reloadData()

    }
    
    func getData() {
        
        self.newsFeedService.getNews(completion: { [weak self] news in
            guard let self = self else { return }
            self.news = news
            if news.count > 0 {
                
            }
            self.newsFeedTableView.reloadData()
        })
        
        
    }
    
    @IBAction func refreshNewsButton(_ sender: Any) {
        
        self.getData()
    }
    
}


extension NewsFeedViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0: return self.newsFeedTableView.dequeueReusableCell(withIdentifier: "NewsTextTableViewCell", for: indexPath)
        case 1: return self.newsFeedTableView.dequeueReusableCell(withIdentifier: "NewsPhotoTableViewCell", for: indexPath)
        case 2: return self.newsFeedTableView.dequeueReusableCell(withIdentifier: "NewsAuthorAndDateTableViewCell", for: indexPath)
        case 3: return self.newsFeedTableView.dequeueReusableCell(withIdentifier: "NewsLikesAndCommentsTableViewCell", for: indexPath)
        default:
            debugPrint("No cell chosen")
            return self.newsFeedTableView.dequeueReusableCell(withIdentifier: "NewsTextTableViewCell", for: indexPath)
        }
    }
    
    
}

extension NewsFeedViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if self.news.count == 0 {
            (cell as? NewsTextTableViewCell)?.configureNewsText(newsText: "Test News")
        } else {
            (cell as? NewsTextTableViewCell)?.configureNewsText(newsText: self.news[0].text)
        }
        
        
        
        
        (cell as? NewsPhotoTableViewCell)?.configure(name: "post1")
        (cell as? NewsAuthorAndDateTableViewCell)?.configure(author: "Ivan Petrov", date: "25 November 2021")
        (cell as? NewsLikesAndCommentsTableViewCell)?.configure(likes: 5, comments: 10)
    }
    
}
