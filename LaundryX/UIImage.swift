//
//  UIImageExt.swift
//  Template1
//
//  Created by OmarAltawashi on 6/8/17.
//  Copyright © 2017 UnitOne. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    
     func imageWithColor(color: UIColor, size: CGSize) -> UIImage
    {
        let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
