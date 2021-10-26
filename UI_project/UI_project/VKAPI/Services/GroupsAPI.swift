//
//  GroupsAPI.swift
//  UI_project
//
//  Created by Дмитрий on 21.10.2021.
//

import Foundation
import Alamofire

struct Group {
    
}

class GroupsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let method = "/groups.get"
    let token = Session.shared.token
    let userId = String(Session.shared.userId)
    let version = "5.81"
    let extended = "1"
    let fields = "city, activity, verified"
    let count = "2"
    
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
            print("Response: \(response.value)")
        })
        
    }
    
}
