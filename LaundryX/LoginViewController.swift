//
//  LoginViewController.swift
//  LaundryX
//
//  Created by Ahmed Abu Shammala on 2/10/18.
//  Copyright © 2018 UnitOne. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var MobileView: UIView!
    @IBOutlet weak var SignInBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.animateRandom()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Sign In"
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]

        
        self.navigationController!.navigationBar.shadowImage = UIImage()
        if #available(iOS 11, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
            
        }
        
        self.SignInBtn.DrawShadow()
        self.MobileView.layer.cornerRadius = 5
        self.MobileView.clipsToBounds = true
        
        self.SignInBtn.layer.cornerRadius = 5

    }

    @IBAction func LoginAction(_ sender: Any)
    {
        let Story = UIStoryboard(name: "Order", bundle: nil)
        let vc = Story.instantiateViewController(withIdentifier: "MyTabBarView") as? MyTabBarView
//        vc?.selectedIndex = 2
        let nav = UINavigationController(rootViewController: vc!)
        nav.modalTransitionStyle = .crossDissolve
        
        self.setRootViewController(rootViewController: nav)
    }
    func setRootViewController(rootViewController: UIViewController) {
        // dismiss presented view controllers before switch rootViewController to avoid messed up view hierarchy, or even crash
        let presentedViewController = self.findPresentedViewControllerStartingFrom(start: UIApplication.shared.keyWindow!.rootViewController!)
        self.dismissPresentedViewController(vc: presentedViewController, completionBlock: {() -> Void in
            UIApplication.shared.keyWindow!.rootViewController = rootViewController
        })
    }
    
    func findPresentedViewControllerStartingFrom(start: UIViewController) -> UIViewController {
        if (start is UINavigationController) {
            return self.findPresentedViewControllerStartingFrom(start: (start as! UINavigationController).topViewController!)
        }
        if (start is UITabBarController) {
            return self.findPresentedViewControllerStartingFrom(start: (start as! UITabBarController).selectedViewController!)
        }
        if start.presentedViewController == nil || start.presentedViewController!.isBeingDismissed {
            return start
        }
        return self.findPresentedViewControllerStartingFrom(start: start.presentedViewController!)
    }
    
    func dismissPresentedViewController(vc: UIViewController, completionBlock: @escaping () -> Void) {
        // if vc is presented by other view controller, dismiss it.
        if (vc.presentingViewController != nil) {
            let nextVC = vc.presentingViewController!
            vc.dismiss(animated: false, completion: {() -> Void in
                // if the view controller which is presenting vc is also presented by other view controller, dismiss it
                if (nextVC.presentingViewController != nil) {
                    self.dismissPresentedViewController(vc: nextVC, completionBlock: completionBlock)
                }
                else {
                    completionBlock()
                }
            })
        }
        else {
            completionBlock()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
