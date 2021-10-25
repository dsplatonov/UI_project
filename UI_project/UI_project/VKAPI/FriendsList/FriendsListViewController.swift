//
//  FriendsListViewController.swift
//  UI_project
//
//  Created by Дмитрий on 21.10.2021.
//

import UIKit

class FriendsListViewController: UIViewController {

    @IBOutlet private var searchTextField: UITextField!
    @IBOutlet private var tableWithResults: UITableView!

    
    private let friendsService = FriendsAPI()
    private var friends: [Friend] = []
    
    private let photoService = PhotosAPI()
    private var photos: [Photo] = []
    
    private let groupService = GroupsAPI()
    private var groups: [Group] = []
    
    private let groupsSearchService = GroupsSearchAPI()
    private var searchResults: [GroupSearch] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableWithResults.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

    }
    
    @IBAction func getFriendsListButtonPressed(_ sender: Any) {
        

        friendsService.getFriends(completion: { [weak self] friends in
            self?.friends = friends
            self?.tableWithResults.reloadData()
            print("Friends list successfully received")
        })
        
    }
    
    @IBAction func getPhotosListButtonPressed(_ sender: Any) {

        photoService.getPhotos(completion: { photos in
            self.photos = photos
            self.tableWithResults.reloadData()
            print("Photos list successfully received")
        })
        
    }
    @IBAction func getGroupsListButtonePressed(_ sender: Any) {
        
        groupService.getGroups(completion: { groups in
            self.groups = groups
            self.tableWithResults.reloadData()
            print("Groups list successfully received")
        })
        
    }
    
    @IBAction func searchGroupsButtonPressed(_ sender: Any) {
        
        let searchQuery = searchTextField.text ?? "Test"
        groupsSearchService.searchGroups(query: searchQuery, completion: { searchResults in
            self.searchResults = searchResults
            self.tableWithResults.reloadData()
            print("Search completed")
        })
        
    }

}

extension FriendsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return friends.count
//        return photos.count
//        return groups.count
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        let currentFriend = friends[indexPath.row]
        
        //PhotoAPI
//        let currentPhoto = photos[indexPath.row]
//        let photoSize: Size = currentPhoto.sizes[2]
//        let photoURL = photoSize.url
//        debugPrint(photoURL)
//        var image: UIImage?
//        let url = NSURL(string: photoURL)! as URL
//        if let imageData: NSData = NSData(contentsOf: url) {
//            image = UIImage(data: imageData as Data)
//        }
//        cell.imageView?.image = image
//        cell.textLabel?.text = String(currentPhoto.id)
//        return cell
        
        //GroupAPI
//        let currentGroup = groups[indexPath.row]
//        cell.textLabel?.text = currentGroup.name
        
        //Group Search API
        let currentSearchResult = searchResults[indexPath.row]
        cell.textLabel?.text = currentSearchResult.name
        return cell
    }
    
    
}
