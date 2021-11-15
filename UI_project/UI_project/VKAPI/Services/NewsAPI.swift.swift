//
//  NewsAPI.swift.swift
//  UI_project
//
//  Created by Дмитрий on 15.11.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class NewsfeedAPI {
    let baseUrl = "https://api.vk.com/method"
    let method = "/newsfeed.get"
    let token = Session.shared.token
    let userId = String(Session.shared.userId)
    let version = "5.111"
    let filters = "post"
    let count = "2"
    
    func getNews(completion: @escaping([News]) ->()) {
        let parameters: Parameters = [
            "user_id": userId,
            "access_token": token,
            "v": version,
            "filters": filters,
            "count": count
        ]
        let url = baseUrl + method
        AF.request(url, method: .get, parameters: parameters).responseJSON(completionHandler: { response in
            
            guard let data = response.data else { return }
            debugPrint(data.prettyJSON)
            
            do {
                let newsfeedData = try JSON(data: data)["response"]["items"].rawData()
                let news = try JSONDecoder().decode([News].self, from: newsfeedData)
                completion(news)
            } catch {
                debugPrint(error.localizedDescription)
            }
            
            
        })
    }
    
}
