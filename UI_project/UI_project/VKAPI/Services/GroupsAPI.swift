//
//  GroupsAPI.swift
//  UI_project
//
//  Created by Дмитрий on 21.10.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class GroupsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let method = "/groups.get"
    let token = Session.shared.token
    let userId = String(Session.shared.userId)
    let version = "5.81"
    let extended = "1"
    let fields = "city, activity, verified"
    let count = "10"
    
    func getGroups(completion: @escaping([Group])->()){
        
        let parameters: Parameters = [
            "user_id": userId,
            "access_token": token,
            "v": version,
            "extended": extended,
            "fields": fields,
            "count": count
        ]
        let url = baseUrl + method
        AF.request(url, method: .get, parameters: parameters).responseJSON(completionHandler: { response in
//            print("Response: \(response.value)")
            guard let data = response.data else { return }
            debugPrint(data.prettyJSON)
            
            do {
                //navigating with SwiftyJSON
                let groupData = try JSON(data)["response"]["items"].rawData()
                let groups = try JSONDecoder().decode([Group].self, from: groupData)
//                debugPrint("Groups: \(groups)")
                completion(groups)
            } catch {
                debugPrint(error)
                
            }
            
        })
        
    }
    
}
