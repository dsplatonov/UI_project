//
//  Newsfeed.swift
//  UI_project
//
//  Created by Дмитрий on 15.11.2021.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let news = try? newJSONDecoder().decode(News.self, from: jsonData)

import Foundation

//// MARK: - News
//struct News: Codable {
//    let response: Response
//}

// MARK: - Response
//struct News: Codable {
//    let items: [Item]
////    let groups: [Group]
////    let profiles: [Profile]
//    let nextFrom: String
//
//    enum CodingKeys: String, CodingKey {
//        case items
//        case nextFrom = "next_from"
//    }
//}

// MARK: - Group
//struct Group: Codable {
//    let id: Int
//    let photo100, photo50, photo200: String
//    let type, screenName, name: String
//    let isClosed: Int
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case photo100 = "photo_100"
//        case photo50 = "photo_50"
//        case photo200 = "photo_200"
//        case type
//        case screenName = "screen_name"
//        case name
//        case isClosed = "is_closed"
//    }
//}

// MARK: - Item
struct News: Codable {
//    let comments: Comments
    let canSetCategory, isFavorite: Bool
//    let likes: Likes
//    let reposts: Comments
    let type, postType: String
    let date, sourceID: Int
    let text: String
    let canDoubtCategory: Bool
//    let attachments: [Attachment]
    let postID: Int
//    let views: Comments

    enum CodingKeys: String, CodingKey {
        case canSetCategory = "can_set_category"
        case isFavorite = "is_favorite"
        case type
        case postType = "post_type"
        case date
        case sourceID = "source_id"
        case text
        case canDoubtCategory = "can_doubt_category"
//        case markedAsAds = "marked_as_ads"
        case postID = "post_id"
    }
}

// MARK: - Attachment
//struct Attachment: Codable {
//    let type: String
//    let photo: Photo?
//    let link: Link?
//}

// MARK: - Link
//struct Link: Codable {
//    let isFavorite: Bool
//    let title: String
//    let url: String
//    let linkDescription, target: String
//
//    enum CodingKeys: String, CodingKey {
//        case isFavorite = "is_favorite"
//        case title, url
//        case linkDescription = "description"
//        case target
//    }
//}

// MARK: - Photo
//struct Photo: Codable {
//    let albumID, id, date: Int
//    let text: String
//    let userID: Int
//    let sizes: [Size]
//    let hasTags: Bool
//    let ownerID: Int
//    let accessKey: String
//    let postID: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case albumID = "album_id"
//        case id, date, text
//        case userID = "user_id"
//        case sizes
//        case hasTags = "has_tags"
//        case ownerID = "owner_id"
//        case accessKey = "access_key"
//        case postID = "post_id"
//    }
//}

//// MARK: - Size
//struct Size: Codable {
//    let width, height: Int
//    let url: String
//    let type: String
//}
//
//// MARK: - Comments
//struct Comments: Codable {
//    let count: Int
//}
//
//// MARK: - Likes
//struct Likes: Codable {
//    let count, canLike, userLikes: Int
//
//    enum CodingKeys: String, CodingKey {
//        case count
//        case canLike = "can_like"
//        case userLikes = "user_likes"
//    }
//}
//
//// MARK: - Profile
//struct Profile: Codable {
//    let canAccessClosed: Bool
//    let screenName: String
//    let online, id: Int
//    let photo100: String
//    let lastName: String
//    let photo50: String
//    let onlineInfo: OnlineInfo
//    let sex: Int
//    let isClosed: Bool
//    let firstName: String
//
//    enum CodingKeys: String, CodingKey {
//        case canAccessClosed = "can_access_closed"
//        case screenName = "screen_name"
//        case online, id
//        case photo100 = "photo_100"
//        case lastName = "last_name"
//        case photo50 = "photo_50"
//        case onlineInfo = "online_info"
//        case sex
//        case isClosed = "is_closed"
//        case firstName = "first_name"
//    }
//}
//
//// MARK: - OnlineInfo
//struct OnlineInfo: Codable {
//    let visible, isMobile, isOnline: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case visible
//        case isMobile = "is_mobile"
//        case isOnline = "is_online"
//    }
//}
