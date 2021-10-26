//
//  Data+PrettyJSON.swift
//  UI_project
//
//  Created by Дмитрий on 22.10.2021.
//

import Foundation

extension Data {

     var prettyJSON: NSString? { /// NSString gives us a nice sanitized debugDescription
         guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
               let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
               let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

         return prettyPrintedString
     }
 }
