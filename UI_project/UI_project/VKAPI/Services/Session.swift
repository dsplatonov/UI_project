//
//  Session.swift
//  UI_project
//
//  Created by Дмитрий on 18.10.2021.
//

import Foundation
import SwiftKeychainWrapper


final class Session {
    
    private init() {}
    
    static let shared = Session()
    
    //Using Keychain for token storage
    var token: String {
        set {
            KeychainWrapper.standard.set(newValue, forKey: "token")
        }
        get {
            return KeychainWrapper.standard.string(forKey: "token") ?? ""
        }
    }
    
    //Using UserDefaults for id storage
    var userId: Int {
        set {
            UserDefaults.standard.set(newValue, forKey: "userId")
        }
        get {
            return UserDefaults.standard.integer(forKey: "userId")
        }
    }
    
    
}
