//
//  FriendsAPI.swift
//  UI_project
//
//  Created by Дмитрий on 20.10.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

final class FriendsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = String(Session.shared.userId)
    let version = "5.81"
    let method = "/friends.get"
    let count = "8"
    let fields = "nickname, domain, sex, bdate"
    let order = "hints"
    let friendDB = FriendDatabase()
    
    func getFriends(completion: @escaping([Friend])->()){
        let parameters: Parameters = [
            "user_id": userId,
            "order": order,
            "fields": fields,
            "count": count,
            "access_token": token,
            "v": version
        ]
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON(completionHandler: { response in
//            print("Response: \(response.value)")
            
            guard let data = response.data else { return }
            debugPrint(data.prettyJSON)
            
            do {
                //navigating with SwiftyJSON
                let itemsData = try JSON(data)["response"]["items"].rawData()
                let friends = try JSONDecoder().decode([Friend].self, from: itemsData)
                
                // deleting old friends from db if applicable
                let oldFriends = self.friendDB.read()
                oldFriends.forEach {
                    self.friendDB.delete($0)
                }
                
                //adding new list of friends
                
                friends.forEach {
                    self.friendDB.create($0)
                }
//                debugPrint("Friends: \(friends)")
                completion(friends)
                
            } catch {
                debugPrint(error)
            }
            
            
        })
        
    }
    
}
