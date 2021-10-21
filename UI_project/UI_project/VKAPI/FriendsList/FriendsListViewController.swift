//
//  FriendsListViewController.swift
//  UI_project
//
//  Created by Дмитрий on 21.10.2021.
//

import UIKit

class FriendsListViewController: UIViewController {

    @IBOutlet private var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func getFriendsListButtonPressed(_ sender: Any) {
        
        let friendsService = FriendsAPI()
        friendsService.getFriends(completion: { friends in
            print("Friends list successfully received")
        })
        
    }
    
    @IBAction func getPhotosListButtonPressed(_ sender: Any) {
        let photosService = PhotosAPI()
        photosService.getPhotos(completion: { photos in
            print("Photos list successfully received")
        })
        
    }
    @IBAction func getGroupsListButtonePressed(_ sender: Any) {
        
        let groupService = GroupsAPI()
        groupService.getGroups(completion: { groups in
            print("Groups list successfully received")
        })
        
    }
    
    @IBAction func searchGroupsButtonPressed(_ sender: Any) {
        
        let searchQuery = searchTextField.text ?? "Test"
        let groupsSearchService = GroupsSearchAPI()
        groupsSearchService.searchGroups(query: searchQuery, completion: { searchResults in
            print("Search completed")
        })
        
    }
    
    
}
