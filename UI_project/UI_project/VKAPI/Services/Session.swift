//
//  Session.swift
//  UI_project
//
//  Created by Дмитрий on 18.10.2021.
//

import Foundation

final class Session {
    
    private init() {}
    
    static let shared = Session()
    
    var token: String = ""
    var userId: Int = 0
    
    
}