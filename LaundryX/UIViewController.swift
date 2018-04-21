//
//  UIViewControllerExt.swift
//  Template1
//
//  Created by OmarAltawashi on 6/7/17.
//  Copyright © 2017 UnitOne. All rights reserved.
//

import Foundation
import SideMenu

extension UIViewController {
    

    
    func setupMenu(){
        
        let rightBarButtonItem = UIBarButtonItem(image: UIImage(named:"Menu"), style: .done, target:  self, action: #selector(ShowMenu(_:)))
        self.navigationItem.leftBarButtonItem = rightBarButtonItem
        
        if LanguageManager.isCurrentLanguageRTL() {
            
            
            
        }
        else{
            
        }
    }
    
    func ShowMenu(_ sender:Any){
        
        if LanguageManager.isCurrentLanguageRTL() {
            
            present(SideMenuManager.menuRightNavigationController!, animated: true, completion: nil)
            
        }
        else{
            present(SideMenuManager.menuLeftNavigationController!, animated: true, completion: nil)
            
        }
        
    }
    
    func showTabBar(){
        
        self.tabBarController?.setTabBarVisible(true, animated: true)
     }
    
    
    
    func hideTabBar(){
        
        self.tabBarController?.setTabBarVisible(false, animated: true)
     }
    
}
