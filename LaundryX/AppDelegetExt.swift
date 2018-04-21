//
//  AppDelegetExt.swift
//  iOSTemplate
//
//  Created by Omar Al tawashi on 7/11/17.
//  Copyright © 2017 Omar Al tawashi. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate {
    
    
    func switchRootViewController(rootViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        if animated {
            
             UIView.transition(with: window!, duration: 0.5, options: .transitionCrossDissolve, animations: {
                
                let oldState: Bool = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                self.window!.rootViewController = rootViewController
                UIView.setAnimationsEnabled(oldState)
            }, completion: { (finished: Bool) -> () in
                
                 if (completion != nil) {
                    completion!()
                }
            })
        } else {
            window!.rootViewController = rootViewController
        }
    }
}

