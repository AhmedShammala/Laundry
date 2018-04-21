//
//  ViewController.swift
//  iOSTemplate
//
//  Created by Ahmed Abu Shammala on 7/1/17.
//  Copyright © 2017 Ahmed Abu Shammala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UINavigationManager.shared.showAlertMessage(MessageCode.disconnected.rawValue, theme: .success, messageType:.PopUp, title: nil, body: nil )
        
        let viewController = UIStoryboard.loadViewController()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIStoryboard {
    class func loadViewController() -> ViewController {
        return loadFromMain("ViewController") as! ViewController
        
        // or a bit longer syntax if you did not add convenience method in the fileprivate extension
        // return load(from: .main, identifier: "UserProfileViewController") as! UserProfileViewController
    }
    
    // add other app view controller load methods here ...
}
