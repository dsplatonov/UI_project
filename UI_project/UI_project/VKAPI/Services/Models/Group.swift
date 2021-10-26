//
//  Group.swift
//  UI_project
//
//  Created by Дмитрий on 25.10.2021.
//



import Foundation

// MARK: - Group
struct Group: Codable {
    let id, isClosed, isAdvertiser: Int
    let type: String
    let isMember: Int
    let city: City?
    let photo50, photo200: String
    let isAdmin: Int
    let photo100: String
    let name, screenName: String

    enum CodingKeys: String, CodingKey {
        case id
        case isClosed = "is_closed"
        case isAdvertiser = "is_advertiser"
        case type
        case isMember = "is_member"
        case city
        case photo50 = "photo_50"
        case photo200 = "photo_200"
        case isAdmin = "is_admin"
        case photo100 = "photo_100"
        case name
        case screenName = "screen_name"
    }
}

// MARK: - City
struct City: Codable {
    let id: Int
    let title: String
}
