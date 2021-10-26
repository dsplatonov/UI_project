//
//  Friend.swift
//  UI_project
//
//  Created by Дмитрий on 22.10.2021.
//

import Foundation
import RealmSwift

// MARK: - Friend
class Friend: Object, Codable {
    @objc dynamic var bdate: String?
    @objc dynamic var id: Int
    @objc dynamic var lastName: String
    @objc dynamic var sex: Int
    @objc dynamic var firstName: String

    enum CodingKeys: String, CodingKey {
        case bdate, id
        case lastName = "last_name"
        case sex
        case firstName = "first_name"
    }
}
