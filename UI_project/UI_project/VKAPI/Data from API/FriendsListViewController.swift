//
//  FriendsListViewController.swift
//  UI_project
//
//  Created by Дмитрий on 21.10.2021.
//

import UIKit
import RealmSwift
import Firebase

class FriendsListViewController: UIViewController {

    @IBOutlet private var searchTextField: UITextField!
    @IBOutlet var tableWithResults: UITableView!

    
    private let friendsService = FriendsAPI()
    var friends: [Friend] = []
    
    private let photoService = PhotosAPI()
    private var photos: [Photo] = []
    
    private let groupService = GroupsAPI()
    private var groups: [Group] = []
    
    private let groupsSearchService = GroupsSearchAPI()
    private var searchResults: Results<GroupSearch>?
    
    private var resultsList:[GroupSearch] = []
    
    private var newsfeedService = NewsfeedAPI()
    private var newsfeed: [News] = []
    private var newsfeedGroups: [NewsfeedGroup] = []
    private var newsfeedProfiles: [NewsfeedProfile] = []
    
    private let friendDB = FriendDatabase()
    private let photosDB = PhotoDatabase()
    private let groupsDB = GroupDatabase()
    private let groupSearchDB = GroupSearchDatabase()
    
    private var token: NotificationToken?
    
    let firebaseRef = Database.database().reference(withPath: "Groups")
    
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

        
        //Realtime results
//        friendsService.getFriends(completion: { [weak self] friends in
//
//            if let newFriends = self?.friendDB.read() {
//                self?.friends = newFriends
//            }
//
//            self?.tableWithResults.reloadData()
//            print("Friends list successfully received")
//        })
        
        
        
        //Operation queue results
        let operationsQueue = OperationQueue.main
        
        //Creating operations
        let getFriends = GetDataFromURL()
        let parseFriends = ParseData()
        let showFriends = PresentFriends(controller: self)

        
        parseFriends.addDependency(getFriends)
        showFriends.addDependency(parseFriends)
        
        let operations = [getFriends, parseFriends, showFriends]
        operationsQueue.addOperations(operations, waitUntilFinished: false)
        
        //Adding operations to queue
//        operationsQueue.addOperation(getFriends)
//        
//        operationsQueue.addOperation(parseFriends)
//        
//        OperationQueue.main.addOperation(showFriends)
        
        debugPrint("Queue done")

        
        
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
            
            guard let self = self else { return }
            
            //getting search results from database
//            if let newSearchResults = self.groupSearchDB.read() {
//                self.searchResults = newSearchResults
//            }
            
            self.searchResults = self.groupSearchDB.read()
            
            self.token = self.searchResults?.observe { [weak self] changes in
                guard let self = self else { return }
                
                switch changes {
                case .initial:
                    self.tableWithResults.reloadData()
                case .update(_, let deletions, let insertions, let modifications):
                    self.tableWithResults.beginUpdates()
                    self.tableWithResults.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
                    self.tableWithResults.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
                    self.tableWithResults.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
                    self.tableWithResults.endUpdates()
                case .error(let error):
                    fatalError("\(error)")
                }
            }
            self.tableWithResults.reloadData()
            print("Search completed")
        })
        
    }
    
    @IBAction func getNewsButtonPressed(_ sender: Any) {
        newsfeedService.getNews(completion: { news, groups, profiles in
            self.newsfeed = news
            self.newsfeedGroups = groups
            self.newsfeedProfiles = profiles
            self.tableWithResults.reloadData()
        })
    }
    
    @IBAction func newsfeedButtonPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "NewsFeed", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()
        vc?.modalPresentationStyle = .fullScreen
        if let vc = vc {
            self.present(vc, animated: true, completion: nil)
        }
        
    }
    
    
}

extension FriendsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //Friends API case
        return friends.count
        
        //Photos API case
//        return photos.count
        
        //Groups API case
//        return groups.count
        
        //Group Search API case
//        guard let searchResults = searchResults else { return 0 }
//        return searchResults.count
        
        //Newsfeed API
//        return newsfeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        //Friend API
        let currentFriend = friends[indexPath.row]
        cell.textLabel?.text = currentFriend.lastName + " " + currentFriend.firstName
        
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
//
//        let photoURL = URL(string: currentGroup.photo100)
//        let data = try? Data(contentsOf: photoURL!)
//        cell.imageView?.image = UIImage(data: data!)
//        cell.textLabel?.text = currentGroup.name
//
//        let userId = Session.shared.userId
//
//        var groupsList: [String] = []
//        self.groups.forEach {
//            groupsList.append($0.name)
//        }
//
//        let firebaseGroup = GroupFirebase(id: String(userId), groups: groupsList)
//        firebaseRef.setValue(firebaseGroup.toAnyObject())
        
        
        //Group Search API
//        let currentSearchResult = searchResults?[indexPath.row]
//        cell.textLabel?.text = currentSearchResult?.name
        
        //Newsfeed API
//        let currentNews = newsfeed[indexPath.row]
//        cell.textLabel?.text = currentNews.text
        
        return cell
    }
    
    
}
