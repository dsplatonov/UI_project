//
//  ParseData.swift
//  UI_project
//
//  Created by Дмитрий on 01.12.2021.
//

import Foundation
import SwiftyJSON

class ParseData: Operation {
    var friends: [Friend]? = []
    
    override func main() {
        guard let friendsData = dependencies.first as? GetDataFromURL,
              let data = friendsData.outputData else { return }
        
        do {
            let itemsData = try JSON(data)["response"]["items"].rawData()
            self.friends = try JSONDecoder().decode([Friend].self, from: itemsData)
            
        } catch {
            debugPrint(error)
        }
        
        debugPrint("Parsing done")
        
    }
    
}
