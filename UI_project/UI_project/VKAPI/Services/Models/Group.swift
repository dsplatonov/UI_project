//
//  Group.swift
//  UI_project
//
//  Created by Дмитрий on 25.10.2021.
//

import Foundation
import RealmSwift

// MARK: - Group
class Group: Object, Codable {
    @objc dynamic var id, isClosed, isAdvertiser: Int
    @objc dynamic var type: String
    @objc dynamic var isMember: Int
//    @objc dynamic var city: City
    @objc dynamic var photo50, photo200: String
    @objc dynamic var isAdmin: Int
    @objc dynamic var photo100: String
    @objc dynamic var name, screenName: String

    enum CodingKeys: String, CodingKey {
        case id
        case isClosed = "is_closed"
        case isAdvertiser = "is_advertiser"
        case type
        case isMember = "is_member"
//        case city
        case photo50 = "photo_50"
        case photo200 = "photo_200"
        case isAdmin = "is_admin"
        case photo100 = "photo_100"
        case name
        case screenName = "screen_name"
    }
}

// MARK: - City
//class City: Object, Codable {
//    @objc dynamic var id: Int
//    @objc dynamic var title: String
//}
