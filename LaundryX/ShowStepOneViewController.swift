//
//  ShowStepOneViewController.swift
//  HomeFix
//
//  Created by Omar Al tawashi on 2/24/16.
//  Copyright ©  2016 unitone itc. All rights reserved.
//

import UIKit

class ShowStepOneViewController: UIViewController {

    
    @IBOutlet weak var BGImage: UIImageView!
    @IBOutlet weak var textlbl:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")

        
    
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    
//    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
//        return .Portrait
//        
//    }
//    
//    override func shouldAutorotate() -> Bool {
//        // Lock autorotate
//        return false
//    }
//    
//    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
//        return  .Portrait
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
