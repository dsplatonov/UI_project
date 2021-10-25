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

//// MARK: - Photos
//struct Photos: Codable {
//    let response: Response
//}
//
//// MARK: - Response
//struct Response: Codable {
//    let count: Int
//    let items: [Item]
//}

// MARK: - Photo
struct Photo: Codable {
    let albumID, id, date: Int
    let postID: Int?
    let text: String
    let sizes: [Size]
    let hasTags: Bool
    let ownerID: Int

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case postID = "post_id"
        case id, date, text, sizes
        case hasTags = "has_tags"
        case ownerID = "owner_id"
    }
}

// MARK: - Size
struct Size: Codable {
    let width, height: Int
    let url: String
    let type: String
}
