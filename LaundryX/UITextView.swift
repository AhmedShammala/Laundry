//
//  UITextView.swift
//  iOSTemplate
//
//  Created by Ahmed Abu Shammala on 7/26/17.
//  Copyright © 2017 UnitOne. All rights reserved.
//

import UIKit

extension UITextView {
    
    func setLabelTextAlignment(Alignment:NSTextAlignment){
        
        if(textAlignment == .left || textAlignment == .right)
        {
            textAlignment = Alignment
        }
}
}
