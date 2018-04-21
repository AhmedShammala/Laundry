//
//  UITextFieldExt.swift
//  Template1
//
//  Created by OmarAltawashi on 6/7/17.
//  Copyright © 2017 UnitOne. All rights reserved.
//

import Foundation
import UIKit

var key: Void?
class UITextFieldAdditions: NSObject {
    var readonly: Bool = false
}
extension UITextField {
    
    
    
    var readonly: Bool {
        get {
            return self.getAdditions().readonly
        }
        set {
            self.getAdditions().readonly = newValue
        }
    }
    
    fileprivate func getAdditions() -> UITextFieldAdditions {
        var additions = objc_getAssociatedObject(self, &key) as? UITextFieldAdditions
        if additions == nil {
            additions = UITextFieldAdditions()
            
            
            objc_setAssociatedObject(self, &key, additions!, objc_AssociationPolicy( rawValue: objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC.rawValue)!)
        }
        return additions!
    }
    
    open override func target(forAction action: Selector, withSender sender: Any?) -> Any? {
        if ((action == #selector(UIResponderStandardEditActions.paste(_:)) || (action == #selector(UIResponderStandardEditActions.cut(_:)))) && self.readonly) {
            return nil
        }
        return super.target(forAction: action, withSender: sender)
    }
    
    
    func setLabelTextAlignment(Alignment:NSTextAlignment){
        if(textAlignment == .left || textAlignment == .right)
        {
            textAlignment = Alignment
        }
    }
}
