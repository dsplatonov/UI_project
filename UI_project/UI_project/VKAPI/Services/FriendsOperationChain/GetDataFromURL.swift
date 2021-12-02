//
//  getDataFromURL.swift
//  UI_project
//
//  Created by Дмитрий on 01.12.2021.
//

import Foundation
import Alamofire

class GetDataFromURL: Operation {
    var outputData: Data?
    
    override func main() {
//        let baseUrl = "https://api.vk.com/method"
        let token = Session.shared.token
        let userId = String(Session.shared.userId)
        let version = "5.81"
//        let method = "/friends.get"
        let count = "8"
        let fields = "nickname, domain, sex, bdate"
        let order = "hints"
        
//        let parameters: Parameters = [
//            "user_id": userId,
//            "order": order,
//            "fields": fields,
//            "count": count,
//            "access_token": token,
//            "v": version
//        ]
//
//        let url = baseUrl + method
        
//        AF.request(url, method: .get, parameters: parameters).responseJSON(completionHandler: { response in
//            print("Response: \(response.value)")
//
//            guard let data = response.data else { return }
//            self.outputData = data
//            debugPrint(data.prettyJSON)
//            debugPrint("Getting data from URL done")
//        })
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/friends.get"
        urlComponents.queryItems = [
        URLQueryItem(name: "access_token", value: token),
        URLQueryItem(name: "user_id", value: userId),
        URLQueryItem(name: "order", value: order),
        URLQueryItem(name: "fields", value: fields),
        URLQueryItem(name: "count", value: count),
        URLQueryItem(name: "v", value: version)
        ]
        guard let url = urlComponents.url else { return }
        guard let data = try? Data(contentsOf: url) else { return }
        self.outputData = data
        debugPrint("Getting data from URL done")

        
    }
}
