//
//  Friend.swift
//  UI_project
//
//  Created by Дмитрий on 22.10.2021.
//



import Foundation

// MARK: - Friend
struct Friend: Codable {
    let bdate: String?
    let id: Int
    let lastName: String
    let sex: Int
    let firstName: String

    enum CodingKeys: String, CodingKey {
        case bdate, id
        case lastName = "last_name"
        case sex
        case firstName = "first_name"
    }
}
