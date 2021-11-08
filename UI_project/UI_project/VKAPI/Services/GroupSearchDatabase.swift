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
    func read() -> Results<GroupSearch>
    func delete(_ results: GroupSearch)
}
final class GroupSearchDatabase: GroupSearchDatabaseProtocol {
    
    var config = Realm.Configuration(schemaVersion: 1)
    
    
    init() {
        self.config.fileURL = config.fileURL?.deletingLastPathComponent().appendingPathComponent("default2.realm")
    }
    

    
    func create(_ results: GroupSearch) {
        let mainRealm = try! Realm(configuration: self.config, queue: nil)
        
        
//        lazy var mainRealm: Realm = { () -> Realm in
//    //        var config = Realm.Configuration(schemaVersion: 1)
//    //        config.fileURL = config.fileURL?.deletingLastPathComponent().appendingPathComponent("default2.realm")
//            let realm = try! Realm(configuration: self.config, queue: nil)
//            return realm
//        }()
        
        try! mainRealm.write {
            mainRealm.add(results)
        }
        
//        do {
//            mainRealm.beginWrite()
//            mainRealm.add(results)
//            try mainRealm.commitWrite()
//        } catch {
//            debugPrint(error.localizedDescription)
//        }
        
    }
    
    func read() -> Results<GroupSearch> {
        let mainRealm = try! Realm(configuration: self.config, queue: nil)
        
//        lazy var mainRealm: Realm = { () -> Realm in
//    //        var config = Realm.Configuration(schemaVersion: 1)
//    //        config.fileURL = config.fileURL?.deletingLastPathComponent().appendingPathComponent("default2.realm")
//            let realm = try! Realm(configuration: self.config, queue: nil)
//            return realm
//        }()

        let results = mainRealm.objects(GroupSearch.self)
        return results
    }
    
    func delete(_ results: GroupSearch) {
        
        let mainRealm = try! Realm(configuration: self.config, queue: nil)
        
//        lazy var mainRealm: Realm = { () -> Realm in
//    //        var config = Realm.Configuration(schemaVersion: 1)
//    //        config.fileURL = config.fileURL?.deletingLastPathComponent().appendingPathComponent("default2.realm")
//            let realm = try! Realm(configuration: self.config, queue: nil)
//            return realm
//        }()
        
//        do {
//            mainRealm.beginWrite()
//            mainRealm.delete(results)
//            try mainRealm.commitWrite()
//        } catch {
//            debugPrint(error.localizedDescription)
//        }
        
        try! mainRealm.write {
            mainRealm.delete(results)
        }
        
    }
    
    
}
