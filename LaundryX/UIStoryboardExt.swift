//
//  UIStoryboardExt.swift
//  iOSTemplate
//
//  Created by OmarAltawashi on 7/16/17.
//  Copyright © 2017 UnitOne. All rights reserved.
//

import Foundation
import UIKit


 enum Storyboard : String {
    
    case main = "Main"
    // add enum case for each storyboard in your project
}

 extension UIStoryboard {
    
    static func loadFromMain(_ identifier: String) -> UIViewController {
        return load(from: .main, identifier: identifier)
    }
    
    // optionally add convenience methods for other storyboards here ...
    
    // ... or use the main loading method directly when
    // instantiating view controller from a specific storyboard
    static func load(from storyboard: Storyboard, identifier: String) -> UIViewController {
        let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return uiStoryboard.instantiateViewController(withIdentifier: identifier)
    }
}
