//
//  NewsfeedPhoto.swift
//  UI_project
//
//  Created by Дмитрий on 29.11.2021.
//

import Foundation

// MARK: - Photo
struct NewsfeedGroup: Codable {
    let id: Int
    let photo100, photo50, photo200: String
    let type, screenName, name: String
    let isClosed: Int

    enum CodingKeys: String, CodingKey {
        case id
        case photo100 = "photo_100"
        case photo50 = "photo_50"
        case photo200 = "photo_200"
        case type
        case screenName = "screen_name"
        case name
        case isClosed = "is_closed"
    }
}
