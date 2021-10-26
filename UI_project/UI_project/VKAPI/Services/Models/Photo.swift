//
//  Photo.swift
//  UI_project
//
//  Created by Дмитрий on 22.10.2021.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let photos = try? newJSONDecoder().decode(Photos.self, from: jsonData)

import Foundation
import RealmSwift

// MARK: - Photo
class Photo: Object, Codable {
    @objc dynamic var albumID, id, date: Int
    @objc dynamic var postID: Int
    @objc dynamic var text: String
//    @objc dynamic var sizes: [Size]
    @objc dynamic var hasTags: Bool
    @objc dynamic var ownerID: Int

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case postID = "post_id"
        case id, date, text
//        case sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
    }
}

// MARK: - Size
//class Size: Object, Codable {
//    @objc dynamic var width, height: Int
//    @objc dynamic var url: String
//    @objc dynamic var type: String
//}
