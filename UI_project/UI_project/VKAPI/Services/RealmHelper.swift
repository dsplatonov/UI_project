//
//  RealmHelper.swift
//  UI_project
//
//  Created by Дмитрий on 02.11.2021.
//

import Foundation
import RealmSwift

final class RealmHelper {
    private init() {}
    
    static let shared = RealmHelper()
    let realmConfiguration = Realm.Configuration(schemaVersion: 4)
    
}
