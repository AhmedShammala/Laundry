//
//  UINibExt.swift
//  iOSTemplate
//
//  Created by OmarAltawashi on 7/16/17.
//  Copyright © 2017 UnitOne. All rights reserved.
//

import Foundation
import UIKit

fileprivate extension UINib {
    
    static func nib(named nibName: String) -> UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
    
    static func loadSingleView(_ nibName: String, owner: Any?) -> UIView {
        return nib(named: nibName).instantiate(withOwner: owner, options: nil)[0] as! UIView
    }
}


extension UINib {
    
    class func loadAvatarView(withOwner owner: AnyObject) -> UIView {
        return loadSingleView("AvatarView", owner: owner)
    }
     // add other app view load methods here ...
    
}
