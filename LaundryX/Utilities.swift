//
//  Utilities.swift
//  Weekend-Swift
//
//  Created by Ahmed Abu Shammala on 1/27/17.
//  Copyright © 2017 Ahmed Abu Shammala. All rights reserved.
//

import UIKit
import Foundation
import SystemConfiguration
import MBProgressHUD
import CRToast
import SideMenu


class Utilities: NSObject {
    var hud = MBProgressHUD()

    
    
    func ShowNotfication(Status:String,Body:String)
    {
        
        var Icon = UIImage()
        var BGColor = UIColor()
        
        if(Status == "Success")
        {
//            Icon = UIImage(namxed:"WhiteCheckmark")!
            BGColor = UIColor(netHex:"53d769")!
        }else
        {
//            Icon = UIImage(named:"AlertIcon")!
            BGColor = UIColor(netHex:"fc3d39")!
            
        }
        var options2: [AnyHashable: Any]? = [kCRToastTextKey: Status.localized,
                                             kCRToastSubtitleTextKey:Body.localized,kCRToastTextAlignmentKey:(CRToastAccessoryViewAlignment.center), kCRToastSubtitleTextAlignmentKey: (CRToastAccessoryViewAlignment.center), kCRToastBackgroundColorKey: BGColor, kCRToastAnimationInTypeKey: (CRToastAnimationType.linear), kCRToastAnimationOutTypeKey: (CRToastAnimationType.linear), kCRToastAnimationInDirectionKey: (CRToastAnimationDirection.top), kCRToastAnimationOutDirectionKey: (CRToastAnimationDirection.top), kCRToastNotificationTypeKey: (NSNumber(value: CRToastType.navigationBar.rawValue)),
                                             kCRToastImageKey: Icon,
                                             kCRToastImageAlignmentKey: CRToastAccessoryViewAlignment.left]
        
        
        CRToastManager.showNotification(options: options2, completionBlock: {() -> Void in
            print("Completed")
        })
    }
    
    
    func ShowLoading(status:String,View: UIView)
    {
        if(status == "Show")
        {
            hud = MBProgressHUD.showAdded(to: View, animated: true)
            
            hud.tintColor = UIColor.black
            
            hud.labelText = "Preparing...".localized
            hud.label.textColor = UIColor.white
            
            hud.minSize = CGSize(width: CGFloat(150.0), height: CGFloat(100.0))
            hud.backgroundView.inputView?.backgroundColor = UIColor.orange
            hud.tintColor = UIColor.white
            hud.contentColor = UIColor.white
            hud.bezelView.color = UIColor.black
        }
        else
        {
            hud .hide(animated: true)
            
        }
    }
    
    
    
    func isValidEmail(testStr:String) -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let emailTest  = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
        
    }
    
    
    func SaveData(key:String ,value:NSObject)
    {
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func RemoveData(key:String)
    {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    
}
