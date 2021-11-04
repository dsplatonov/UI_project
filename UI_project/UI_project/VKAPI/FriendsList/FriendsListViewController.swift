//
//  FriendsListViewController.swift
//  UI_project
//
//  Created by Дмитрий on 21.10.2021.
//

import UIKit
import RealmSwift

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
    
    private var resultsList:[GroupSearch] = []
    
    private let friendDB = FriendDatabase()
    private let photosDB = PhotoDatabase()
    private let groupsDB = GroupDatabase()
    private let groupSearchDB = GroupSearchDatabase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableWithResults.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        

        
//        do {
//            try FileManager.default.removeItem(at: Realm.Configuration.defaultConfiguration.fileURL!)
//
//        } catch {
//            debugPrint(error.localizedDescription)
//        }
//        

    }
    
    @IBAction func getFriendsListButtonPressed(_ sender: Any) {

        friendsService.getFriends(completion: { [weak self] friends in
            
            if let newFriends = self?.friendDB.read() {
                self?.friends = newFriends
            }
            
            self?.tableWithResults.reloadData()
            print("Friends list successfully received")
        })
        
    }
    
    @IBAction func getPhotosListButtonPressed(_ sender: Any) {

        photoService.getPhotos(completion: { [weak self] photos in
            //Getting photos from Database
            if let newPhotos = self?.photosDB.read() {
                self?.photos = newPhotos
            }
            
            self?.tableWithResults.reloadData()
            print("Photos list successfully received")
        })
        
    }
    @IBAction func getGroupsListButtonePressed(_ sender: Any) {
        
        groupService.getGroups(completion: { [weak self] groups in
            //getting new groups from database
            if let newGroups = self?.groupsDB.read() {
                self?.groups = newGroups
            }
            
            self?.tableWithResults.reloadData()
            print("Groups list successfully received")
        })
        
    }
    
    @IBAction func searchGroupsButtonPressed(_ sender: Any) {
        

        
        let searchQuery = searchTextField.text ?? "Test"
        groupsSearchService.searchGroups(query: searchQuery, completion: { [weak self] searchResults in
            
            //getting search results from database
            if let newSearchResults = self?.groupSearchDB.read() {
                self?.searchResults = newSearchResults
            }
            
            //Using Realm for uploading and downloading
            
//            let realmConfiguration = Realm.Configuration(schemaVersion: 3)
//            let realm = try! Realm(configuration: realmConfiguration)
//            realm.beginWrite()
//
//            for i in searchResults {
//                realm.add(i)
//            }
//            try! realm.commitWrite()
//
//            let resultsList = realm.objects(GroupSearch.self)
//
//            for i in resultsList {
//                self.searchResults.append(i)
//            }
            
//            for i in self.searchResults {
//                self.searchResults.append(i)
//            }
            
        
            self?.tableWithResults.reloadData()
            print("Search completed")
        })
        
    }

}

extension FriendsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //Friends API case
//        return friends.count
        
        //Photos API case
//        return photos.count
        
        //Groups API case
//        return groups.count
        
        //Group Search API case
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        //Friend API
//        let currentFriend = friends[indexPath.row]
//        cell.textLabel?.text = currentFriend.lastName + " " + currentFriend.firstName
        
        //PhotoAPI
//        let currentPhoto = photos[indexPath.row]
//        let photoSize = currentPhoto.sizes[2]
//        let photoURL = photoSize.url
//        debugPrint(photoURL)
//        var image: UIImage?
//        let url = NSURL(string: photoURL!)! as URL
//        if let imageData: NSData = NSData(contentsOf: url) {
//            image = UIImage(data: imageData as Data)
//        }
//        cell.imageView?.image = image
//        cell.textLabel?.text = String(currentPhoto.text)
        
        //GroupAPI
//        let currentGroup = groups[indexPath.row]
//        var photoURL = URL(string: currentGroup.photo100)
//        let data = try? Data(contentsOf: photoURL!)
//        cell.imageView?.image = UIImage(data: data!)
//        cell.textLabel?.text = currentGroup.name
        
        //Group Search API
        let currentSearchResult = searchResults[indexPath.row]
        cell.textLabel?.text = currentSearchResult.name
        
        return cell
    }
    
    
}
