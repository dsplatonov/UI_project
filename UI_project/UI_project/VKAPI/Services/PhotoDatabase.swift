//
//  PhotoDatabase.swift
//  UI_project
//
//  Created by Дмитрий on 04.11.2021.
//

import Foundation
import RealmSwift

protocol PhotoDBProtocol {
    func create(_ photo: Photo)
    func read() -> [Photo]
    func delete(_ photo: Photo)
}

class PhotoDatabase: PhotoDBProtocol {
    
    lazy var mainRealm: Realm = { () -> Realm in
        var config = Realm.Configuration(schemaVersion: 1)
        config.fileURL = config.fileURL?.deletingLastPathComponent().appendingPathComponent("default2.realm")
        let realm = try! Realm(configuration: config, queue: nil)
        return realm
    }()
    
    func create(_ photo: Photo) {
        
        do {
            mainRealm.beginWrite()
            mainRealm.add(photo)
            try mainRealm.commitWrite()
            debugPrint(mainRealm.configuration.fileURL ?? "")
        } catch {
            debugPrint(error.localizedDescription)
        }
        
    }
    
    func read() -> [Photo] {
        let photos = mainRealm.objects(Photo.self)
        return Array(photos)

    }
    
    func delete(_ photo: Photo) {
        
        do {
            mainRealm.beginWrite()
            mainRealm.delete(photo)
            try mainRealm.commitWrite()
        } catch {
            debugPrint(error.localizedDescription)
        }
        
    }
    
    
}
