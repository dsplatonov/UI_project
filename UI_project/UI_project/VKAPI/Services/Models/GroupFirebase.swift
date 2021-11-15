//
//  GroupFirebase.swift
//  UI_project
//
//  Created by Дмитрий on 10.11.2021.
//

import Foundation
import Firebase

class GroupFirebase {
    let groups: [String]
    let id: String
    let ref: DatabaseReference?
    
    init(id: String, groups: [String]) {
        self.groups = groups
        self.id = id
        self.ref = nil
    }
    
    init?(snapshot: DataSnapshot) {
        
        guard let value = snapshot.value as? [String: Any],
        let groups = value["id"] as? [String],
        let id = value["id"] as? String
        else {
            return nil
        }
        self.ref = snapshot.ref
        self.groups = groups
        self.id = id
    }
    
    func toAnyObject() -> [AnyHashable: Any] {
        return [id: groups] as [AnyHashable: Any]
    }
    
}
