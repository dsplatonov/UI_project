//
//  PhotosAPI.swift
//  UI_project
//
//  Created by Дмитрий on 21.10.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

final class PhotosAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userId = String(Session.shared.userId)
    let version = "5.131"
    let method = "/photos.getAll"
    let extended = "0"
    let count = "10"
    let albums = "0"
    let photosDB = PhotoDatabase()
    
    func getPhotos(completion: @escaping([Photo])->()) {
        
        let parameters: Parameters = [
            "owner_id": userId,
            "extended": extended,
            "count": count,
            "access_token": token,
            "v": version,
            "no_service_albums": albums
        ]
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: parameters).responseJSON(completionHandler: { response in
//            print("Response: \(response.value)")
            
            guard let data = response.data else { return }
            debugPrint(data.prettyJSON)
            
            do {
                //navigating with SwiftyJSON
                let photoData = try JSON(data)["response"]["items"].rawData()
                let photos = try JSONDecoder().decode([Photo].self, from: photoData)
                
                // deleting old photos from database
                let oldPhotos = self.photosDB.read()
                oldPhotos.forEach {
                    self.photosDB.delete($0)
                }
                
                // adding fresh list of photos
                
                photos.forEach {
                    self.photosDB.create($0)
                }
                
                debugPrint("PHOTOS: \(photos)")
                completion(photos)
            } catch {
                debugPrint(error)
            }
            
        })
        
    }
    
    
    
}
