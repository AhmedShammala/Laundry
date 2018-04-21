//
//  OrderTypesController.swift
//  LaundryX
//
//  Created by Ahmed Abu Shammala on 2/10/18.
//  Copyright © 2018 UnitOne. All rights reserved.
//

import UIKit

class OrderTypesController: UIViewController , UIGestureRecognizerDelegate  {

    @IBOutlet weak var IronView: UIView!
    @IBOutlet weak var DryView: UIView!
    @IBOutlet weak var WashView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.animateRandom()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.clear
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.clear]
        
        self.WashView.DrawShadowView()
        self.IronView.DrawShadowView()
        self.DryView.DrawShadowView()

        self.WashView.layer.cornerRadius = 5
        self.IronView.layer.cornerRadius = 5
        self.DryView.layer.cornerRadius = 5
        self.SetTaps()
        
        self.tabBarController?.tabBar.isHidden = false

    }
    
    func SetTaps()
    {
        var tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        tap.delegate = self
        WashView.tag = 0
        WashView.addGestureRecognizer(tap)
        
        
        tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        tap.delegate = self
        DryView.tag = 1
        DryView.addGestureRecognizer(tap)
        
        tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        tap.delegate = self
        IronView.tag = 2
        IronView.addGestureRecognizer(tap)
        
        
        
    }
    
    func handleTap(sender: UITapGestureRecognizer? = nil) {
        // handling code
        print(sender?.view?.tag)
        let Story = UIStoryboard(name: "Order", bundle: nil)
        let vc = Story.instantiateViewController(withIdentifier: "OrderCategoryController") as? OrderCategoryController
        if(sender?.view?.tag == 0)
        {
            vc?.OrderType = "Wash & Iron"
        }
        else if (sender?.view?.tag == 1)
        {
            vc?.OrderType = "Dry Cleaning"
        }
        else
        {
            vc?.OrderType = "Only Iron"
        }
        self.navigationController?.pushViewController(vc!, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
