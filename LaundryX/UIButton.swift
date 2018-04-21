//
//  UIButton.swift
//  LaundryX
//
//  Created by Ahmed Abu Shammala on 2/10/18.
//  Copyright © 2018 UnitOne. All rights reserved.
//

import UIKit

extension UIButton{


    
    func DrawShadow() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//        self.layer.shadowColor = UIColor.red.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 10.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 5
//        self.clipsToBounds = true
    }
    
}
