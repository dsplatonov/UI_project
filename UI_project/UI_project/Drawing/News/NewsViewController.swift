//
//  NewsViewController.swift
//  UI_project
//
//  Created by Дмитрий on 23.09.2021.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet private var newsTable: UITableView!
    
    
    private var newsItems: [NewsPost] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsTable.dataSource = self
        self.newsTable.delegate = self
        self.newsTable.register(Constants.Nib.news, forCellReuseIdentifier: Constants.Cell.news)
        self.getExampleData()

    }
    
    private func getExampleData(){
        let exampleNewsItems: [NewsPost] = [
            .init(userAvatarImageName: "1,2", userName: "Вадим Петров", dateOfThePost: "12.02.2022", textOfThePost: "Равным образом консультация с широким активом требуют определения и уточнения модели развития. Товарищи! постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет выполнять важные задания по разработке модели развития. Повседневная практика показывает, что укрепление и развитие структуры обеспечивает широкому кругу (специалистов) участие в формировании дальнейших направлений развития.", postImageName: "post3", viewsCount: 0, likesCount: 0),
            .init(userAvatarImageName: "4,0", userName: "Благоружко Дмитрий", dateOfThePost: "24.09.2021", textOfThePost: "Значимость этих проблем настолько очевидна, что дальнейшее развитие различных форм деятельности обеспечивает широкому кругу (специалистов) участие в формировании новых предложений. С другой стороны постоянное информационно-пропагандистское обеспечение нашей деятельности обеспечивает широкому кругу (специалистов) участие в формировании позиций, занимаемых участниками в отношении поставленных задач.", postImageName: "post4", viewsCount: 0, likesCount: 0)
        ]
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            self.newsItems = exampleNewsItems
            self.newsTable.reloadData()
            
        }
        
    }


}


extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return newsTable.dequeueReusableCell(withIdentifier: Constants.Cell.news, for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Новости"
    }
    
    
}

extension NewsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? NewsTableViewCell)?.configureNewsCell(with: self.newsItems[indexPath.row])

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 650
    }
//
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 650
//    }
    
}
