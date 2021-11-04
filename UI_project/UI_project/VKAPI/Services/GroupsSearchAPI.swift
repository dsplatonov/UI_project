//
//  GroupsSearchAPI.swift
//  UI_project
//
//  Created by Дмитрий on 21.10.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

final class GroupsSearchAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let method = "/groups.search"
    let token = Session.shared.token
    let userId = String(Session.shared.userId)
    let version = "5.81"
    let type = "group"
    let count = "10"
    
    let groupSearchDB = GroupSearchDatabase()
    
    func searchGroups(query: String, completion: @escaping([GroupSearch])->()) {
        
        let parameters: Parameters = [
            "access_token": token,
            "q": query,
            "v": version,
            "type": type,
            "count": count
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON(completionHandler: { response in
//            print("Response: \(response.value)")
            guard let data = response.data else { return }
            debugPrint(data.prettyJSON)
            
            do {
                //navigating with SwiftyJSON
                let searchData = try JSON(data)["response"]["items"].rawData()
                let searchResults = try JSONDecoder().decode([GroupSearch].self, from: searchData)
                
                //deleting old search results from database
                let oldSearchResults = self.groupSearchDB.read()
                oldSearchResults.forEach {
                    self.groupSearchDB.delete($0)
                }
                
                //adding new search results
                searchResults.forEach {
                    self.groupSearchDB.create($0)
                }
                
//                debugPrint("Search Results: \(searchResults)")
                completion(searchResults)
            } catch {
                debugPrint(error)
            }
            
        })
    }
    
    
}
