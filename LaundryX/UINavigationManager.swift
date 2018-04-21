//
//  UINavigationManager.swift
//  iOSTemplate
//
//  Created by Omar Al tawashi on 7/11/17.
//  Copyright © 2017 UnitOne. All rights reserved.
//

import Foundation
import UIKit
import SwiftMessages


class UINavigationManager:NSObject {
    
   static let shared:UINavigationManager = UINavigationManager()
    
    
    func setupUINavigationController()->UINavigationController {
        
        let nav = UINavigationController()
        
        return nav
    }
    
    func navigationControllerFromWindow(window: UIWindow) -> UINavigationController? {
        let navigationController = window.rootViewController as? UINavigationController
        return navigationController
    }
    
    func tabBarControllerFromWindow(window: UIWindow) -> UITabBarController? {
        let tabBarController = window.rootViewController as? UITabBarController
        return tabBarController
    }
    
    func presentViewController(viewController:UIViewController?,withIdentifier:String,storyName:String)->UIViewController{
        
        let story = UIStoryboard(name: storyName, bundle: nil)
        let controller = story.instantiateViewController(withIdentifier: withIdentifier)
        viewController?.present(controller, animated: true, completion: nil)
        return controller

    }
    
    
    func pushViewController(naviagtionController:UINavigationController?,withIdentifier:String,storyName:String)->UIViewController{
        
        let story = UIStoryboard(name: storyName, bundle: nil)
        let controller = story.instantiateViewController(withIdentifier: withIdentifier)
        naviagtionController?.pushViewController(controller, animated: true)
        return controller

    }
    
    
    
    func GoHomeInitialViewController()->UIViewController{
        
        let story = UIStoryboard(name: "Main", bundle: nil)
        
        let controller = story.instantiateInitialViewController()
        
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        appDelegate?.switchRootViewController(rootViewController: controller!, animated: true, completion: {
            sucess in
        })
        
        return controller!

    }
    
    
    func changeRootViewController(withIdentifier:String,storyName:String)->UIViewController{
        
        let story = UIStoryboard(name: storyName, bundle: nil)
        
        let root = story.instantiateViewController(withIdentifier: withIdentifier)
        
          let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        appDelegate?.switchRootViewController(rootViewController: root, animated: true, completion: {
            sucess in
        })
        return root
    }
    
    func initUINavigationControllerWithRoot(withIdentifier:String,storyName:String)->UIViewController{
        
        let story = UIStoryboard(name: storyName, bundle: nil)
        
        let root = story.instantiateViewController(withIdentifier: withIdentifier)
        
        let controller = UINavigationController(rootViewController: root)
        
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        appDelegate?.switchRootViewController(rootViewController: controller, animated: true, completion: {
            sucess in
        })
        return controller
     }
    
    
    
    func GoStepViewController(naviagtionController:UINavigationController,next:String){
        
        
    
    }
    


    func showAlertMessage(_ error_code:Int? ,theme:Theme?,messageType:MessageLayout, title:String?,body:String?){

        
        let alert_txt = MessageCode.showErrorMessage(error_code, titleMessage: title, body: body)
        
        switch messageType {
        case MessageLayout.PopUp:
            setupPopUpMessage(theme: theme,title:alert_txt.0,body:alert_txt.1)

            break
        case MessageLayout.UIAlertController:
            break
        case MessageLayout.UIActionSheet:
            break
            
        case MessageLayout.DropdownAlert:
            setupMessageView(theme: theme,title:alert_txt.0,body:alert_txt.1)
              break
            
        case MessageLayout.SweetAlert:
            break
        case MessageLayout.SwiftMessages:
            
             setupMessageView(theme: theme,title:alert_txt.0,body:alert_txt.1)
            break
         default:
            
            
            break
        }
    }
    
    func setupMessageView(theme:Theme? ,title:String,body:String){
        
        let error = MessageView.viewFromNib(layout: .tabView)
        error.configureTheme(theme ?? .success)
        error.configureContent(title: title, body: body)
        error.button?.setTitle("Stop", for: .normal)
        
        error.button?.isHidden = true
        SwiftMessages.show(view: error)
    }
    
    func setupPopUpMessage(theme:Theme? ,title:String,body:String){
        
        let messageView: MessageView = MessageView.viewFromNib(layout: .centeredView)
//        messageView.configureBackgroundView(width: 250)
        messageView.configureContent(title: title, body: body, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "No Thanks") { _ in
            SwiftMessages.hide()
        }
        messageView.backgroundView.backgroundColor = UIColor.init(white: 0.97, alpha: 1)
        messageView.backgroundView.layer.cornerRadius = 12
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .center
        config.duration = .forever
        config.dimMode = .blur(style: .dark, alpha: 1, interactive: true)
        config.presentationContext  = .window(windowLevel: UIWindowLevelStatusBar)
        SwiftMessages.show(config: config, view: messageView)
    }
}
