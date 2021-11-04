//
//  GroupDatabase.swift
//  UI_project
//
//  Created by Дмитрий on 04.11.2021.
//

import Foundation
import RealmSwift

protocol GroupDBProtocol {
    func create(_ group: Group)
    func read() -> [Group]
    func delete(_ group: Group)
}

class GroupDatabase: GroupDBProtocol {
    
    lazy var mainRealm: Realm = { () -> Realm in
        var config = Realm.Configuration(schemaVersion: 1)
        config.fileURL = config.fileURL?.deletingLastPathComponent().appendingPathComponent("default2.realm")
        let realm = try! Realm(configuration: config, queue: nil)
        return realm
    }()
    
    func create(_ group: Group) {
        
        do {
            mainRealm.beginWrite()
            mainRealm.add(group)
            try mainRealm.commitWrite()
        } catch {
            debugPrint(error.localizedDescription)
        }
        
    }
    
    func read() -> [Group] {
        let groups = mainRealm.objects(Group.self)
        return Array(groups)
    }
    
    func delete(_ group: Group) {
        
        do {
            mainRealm.beginWrite()
            mainRealm.delete(group)
            try mainRealm.commitWrite()
        } catch {
            debugPrint(error.localizedDescription)
        }
        
    }
    
    
}
