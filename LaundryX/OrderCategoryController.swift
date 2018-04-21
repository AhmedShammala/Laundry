//
//  OrderCategoryController.swift
//  LaundryX
//
//  Created by Ahmed Abu Shammala on 2/24/18.
//  Copyright © 2018 UnitOne. All rights reserved.
//

import UIKit
import ViewAnimator

class OrderCategoryController: UIViewController {

    @IBOutlet weak var TypeTitle: UILabel!
    var OrderType = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.TypeTitle.text = self.OrderType
        self.tabBarController?.tabBar.isHidden = true
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
