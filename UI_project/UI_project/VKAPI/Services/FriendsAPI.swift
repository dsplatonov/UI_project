//
//  FriendsAPI.swift
//  UI_project
//
//  Created by Дмитрий on 20.10.2021.
//

import Foundation
import Alamofire

struct Friend {
    
}

final class FriendsAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = String(Session.shared.userId)
    let version = "5.81"
    let method = "/friends.get"
    let count = "2"
    let fields = "nickname, domain, sex, bdate"
    let order = "hints"
    
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
            print("Response: \(response.value)")
        })
        
    }
    
}
