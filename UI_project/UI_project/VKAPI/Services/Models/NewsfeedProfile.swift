//
//  NewsfeedProfile.swift
//  UI_project
//
//  Created by Дмитрий on 29.11.2021.
//

import Foundation

// MARK: - Profile
struct NewsfeedProfile: Codable {
    let canAccessClosed: Bool?
    let screenName: String?
    let online, id: Int
    let photo100: String
    let lastName: String
    let photo50: String
    let onlineInfo: OnlineInfo
    let sex: Int
    let isClosed: Bool?
    let firstName: String
    let onlineMobile, onlineApp: Int?
    let deactivated: String?

    enum CodingKeys: String, CodingKey {
        case canAccessClosed = "can_access_closed"
        case screenName = "screen_name"
        case online, id
        case photo100 = "photo_100"
        case lastName = "last_name"
        case photo50 = "photo_50"
        case onlineInfo = "online_info"
        case sex
        case isClosed = "is_closed"
        case firstName = "first_name"
        case onlineMobile = "online_mobile"
        case onlineApp = "online_app"
        case deactivated
    }
}

// MARK: - OnlineInfo
struct OnlineInfo: Codable {
    let visible, isMobile, isOnline: Bool
    let lastSeen, appID: Int?

    enum CodingKeys: String, CodingKey {
        case visible
        case isMobile = "is_mobile"
        case isOnline = "is_online"
        case lastSeen = "last_seen"
        case appID = "app_id"
    }
}
