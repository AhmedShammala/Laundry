//
//  NSArray.swift
//  Template1
//
//  Created by OmarAltawashi on 6/13/17.
//  Copyright © 2017 UnitOne. All rights reserved.
//

import Foundation

extension NSArray {
    
    func convertDicationryToJson( )->String?{
        do {
            let jsonData = try  JSONSerialization.data(withJSONObject: self, options: [])
            
            
            
            let  theJSONText = NSString(data: jsonData,
                                        encoding: String.Encoding.ascii.rawValue)
            
            print("JSON string = \(theJSONText!)")
            
            //            theJSONText = theJSONText!.replacingOccurrences(of: "\\", with: "") as NSString?
            return theJSONText!.replacingOccurrences(of: "\\", with: "")
            
        } catch let error as NSError {
            print(error)
        }
        return ""
    }
    
}
