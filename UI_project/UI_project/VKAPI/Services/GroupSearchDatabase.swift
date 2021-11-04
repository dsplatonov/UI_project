//
//  GroupSearchDatabase.swift
//  UI_project
//
//  Created by Дмитрий on 04.11.2021.
//

import Foundation
import RealmSwift

protocol GroupSearchDatabaseProtocol {
    func create(_ results: GroupSearch)
    func read() -> [GroupSearch]
    func delete(_ results: GroupSearch)
}

class GroupSearchDatabase: GroupSearchDatabaseProtocol {
    
    lazy var mainRealm: Realm = { () -> Realm in
        var config = Realm.Configuration(schemaVersion: 1)
        config.fileURL = config.fileURL?.deletingLastPathComponent().appendingPathComponent("default2.realm")
        let realm = try! Realm(configuration: config, queue: nil)
        return realm
    }()
    
    func create(_ results: GroupSearch) {
        
        do {
            mainRealm.beginWrite()
            mainRealm.add(results)
            try mainRealm.commitWrite()
        } catch {
            debugPrint(error.localizedDescription)
        }
        
    }
    
    func read() -> [GroupSearch] {
        let results = mainRealm.objects(GroupSearch.self)
        return Array(results)
    }
    
    func delete(_ results: GroupSearch) {
        
        do {
            mainRealm.beginWrite()
            mainRealm.delete(results)
            try mainRealm.commitWrite()
        } catch {
            debugPrint(error.localizedDescription)
        }
        
    }
    
    
}
