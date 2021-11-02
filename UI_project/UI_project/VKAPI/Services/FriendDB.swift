//
//  FriendDB.swift
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

class FriendDB: FriendDBProtocol {
    
    func create(_ friend: Friend) {
        do {
            lazy var mainRealm = try Realm(configuration: RealmHelper.shared.realmConfiguration, queue: nil)
            mainRealm.beginWrite()
            mainRealm.add(friend)
            try mainRealm.commitWrite()
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    func read() -> [Friend] {
        
        do {
            lazy var mainRealm = try Realm(configuration: RealmHelper.shared.realmConfiguration, queue: nil)
            let friends = mainRealm.objects(Friend.self)
            return Array(friends)
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    
    func delete(_ friend: Friend) {
        
        do {
            lazy var mainRealm = try Realm(configuration: RealmHelper.shared.realmConfiguration, queue: nil)
            mainRealm.beginWrite()
            mainRealm.delete(friend)
            try mainRealm.commitWrite()
            
        } catch {
            debugPrint(error.localizedDescription)
        }
        
        
    }
    
    
}


