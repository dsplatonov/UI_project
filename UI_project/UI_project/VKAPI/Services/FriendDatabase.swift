//
//  FriendDatabase.swift
//  UI_project
//
//  Created by Дмитрий on 02.11.2021.
//


import Foundation
import RealmSwift

protocol FriendDBProtocol {
    func create (_ friend: Friend)
    func read() -> [Friend]
    func delete (_ friend: Friend)
}

class FriendDatabase: FriendDBProtocol {
    
    
    
//    let migration = Realm.Configuration.defaultConfiguration
//    lazy var mainRealm = try! Realm(configuration: migration, queue: nil)
    
    lazy var mainRealm: Realm = { () -> Realm in
        var config = Realm.Configuration(schemaVersion: 1)
        config.fileURL = config.fileURL!.deletingLastPathComponent().appendingPathComponent("default2.realm")
        let realm = try! Realm(configuration: config, queue: nil)
        return realm
        
    }()
    
    func create(_ friend: Friend) {
        
        do {
            mainRealm.beginWrite()
            mainRealm.add(friend)
            try mainRealm.commitWrite()
            debugPrint(mainRealm.configuration.fileURL ?? "")
        } catch {
            debugPrint(error.localizedDescription)
        }
        
    }
    
    func read() -> [Friend] {
        let friends = mainRealm.objects(Friend.self)
        debugPrint(mainRealm.configuration.fileURL ?? "")
        return Array(friends)
    }
    
    func delete(_ friend: Friend) {
        
        do {
            mainRealm.beginWrite()
            mainRealm.delete(friend)
            try mainRealm.commitWrite()
        } catch {
            debugPrint(error.localizedDescription)
        }
        

        
    }
    
    
}
