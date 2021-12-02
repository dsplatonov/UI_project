//
//  PresentFriends.swift
//  UI_project
//
//  Created by Дмитрий on 01.12.2021.
//

import Foundation
import UIKit

class PresentFriends: Operation {
    var controllerToPresent: FriendsListViewController
    
    override func main() {
        guard let parsedData = dependencies.first as? ParseData,
        let friends = parsedData.friends else { return }
        
        
        controllerToPresent.friends = friends
        controllerToPresent.tableWithResults.reloadData()
        
        debugPrint("Presenting done")
        
    }
    
    init(controller: FriendsListViewController) {
        self.controllerToPresent = controller
    }
    
    
}

