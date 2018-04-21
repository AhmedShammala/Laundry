//
//  UILabelExt.swift
//  Template1
//
//  Created by OmarAltawashi on 6/7/17.
//  Copyright © 2017 UnitOne. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
        func setLabelTextAlignment(fontname:String,Alignment:NSTextAlignment){
            
            
            self.font = UIFont(name: fontname, size: CGFloat(self.font.pointSize))
            
            
            if(textAlignment == .left || textAlignment == .right)
            {
                textAlignment = Alignment
            }
        }
    }
