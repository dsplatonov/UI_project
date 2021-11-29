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
    
    func getNews(completion: @escaping([News], [NewsfeedGroup], [NewsfeedProfile]) ->()) {
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

            
            //объявляем переменные
            //группа потоков
            let newsfeedDispatchGroup = DispatchGroup()
            
            //массивы данных для парсинга
            var post: [News] = []
            var group: [NewsfeedGroup] = []
            var profile: [NewsfeedProfile] = []
            
            //делаем поток и добавляем в группу
            //поток по парсингу постов
            DispatchQueue.global().async(group: newsfeedDispatchGroup) {
                do {
                    let newsfeedData = try JSON(data: data)["response"]["items"].rawData()
                    post = try JSONDecoder().decode([News].self, from: newsfeedData)
                    debugPrint("Post: \(post)")
                } catch {
                    debugPrint(error.localizedDescription)
                }
            }
            
            //поток по парсингу групп
            DispatchQueue.global().async(group: newsfeedDispatchGroup) {
                do {
                    let newsfeedGroupData = try JSON(data: data)["response"]["groups"].rawData()
                    group = try JSONDecoder().decode([NewsfeedGroup].self, from: newsfeedGroupData)
                    debugPrint("Groups: \(group)")
                } catch {
                    debugPrint(error.localizedDescription)
                }
            }
            
            //поток по парсингу профилей
            DispatchQueue.global().async(group: newsfeedDispatchGroup) {
                do {
                    let newsfeedProfileData = try JSON(data: data)["response"]["profiles"].rawData()
                    profile = try JSONDecoder().decode([NewsfeedProfile].self, from: newsfeedProfileData)
                    debugPrint("profiles: \(profile)")
                } catch {
                    debugPrint(error.localizedDescription)
                }
            }
            
            //обрабатываем результаты, когда все потоки закончили парсить
            newsfeedDispatchGroup.notify(queue: DispatchQueue.main) {
                debugPrint("All 3 processes done")
                completion(post, group, profile)
            }
            
            

            
            
        })
    }
    
}
