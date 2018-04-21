//
//  OrderPreviewController.swift
//  LaundryX
//
//  Created by Ahmed Abu Shammala on 3/31/18.
//  Copyright © 2018 UnitOne. All rights reserved.
//

import UIKit

class OrderPreviewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var MyStepView: StepsView!
    @IBOutlet weak var TableView: UITableView!
    var popup = KLCPopup()
    var containerView : DoneView = DoneView()
    
    
    @IBOutlet weak var PriceView: UIView!
    var Titles = ["Name","PICKUP ADDRESS","PICKUP DATE & TIME","DELIVERY ADDRESS","DELIVERY DATE & TIME","EMAIL","MOBILE","BASKET DETAILS","NOTES"]
    
    var Icons = ["Name","PickupAddress","PickupTime","PickupAddress","PickupTime","Your_Email","Your_Mobile","BasketDetails","Notes"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.animateRandom()

        self.TableView .register(UINib(nibName: "PreviewCell", bundle: nil), forCellReuseIdentifier: "PreviewCell")
        
        containerView = Bundle.main.loadNibNamed("DoneView", owner: self, options: nil)!.last! as! DoneView

        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
       
       self.PriceView.layer.cornerRadius = 5
        self.PriceView.clipsToBounds = true
        self.MyStepView.Apply(title: "CONFIRM ORDER", Page: 5)
        self.MyStepView.NextBtn.addTarget(self, action: #selector(self.NextPage), for: .touchUpInside)
    }
    func NextPage()
    {
        
        containerView = DoneView()
        containerView = Bundle.main.loadNibNamed("DoneView", owner: self, options: nil)!.last! as! DoneView
        
//        containerView.AddBtn.addTarget(self, action: #selector(self.OkBtn), for: UIControlEvents.touchUpInside)

        
        containerView.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(250), height: CGFloat(200))
        
        
        self.popup = KLCPopup()
        self.popup.dismissType = KLCPopupDismissType.bounceOut
        self.popup.showType = KLCPopupShowType.bounceIn
        self.popup.contentView = containerView
        popup.shouldDismissOnBackgroundTouch = true
        //        popup.backgroundColor = UIColor.green
        popup.backgroundView.backgroundColor = UIColor.black
        
        self.popup.show()

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreviewCell", for: indexPath) as! PreviewCell
        cell.Titlelbl.text = Titles[indexPath.row]
        cell.IconImg.image = UIImage(named :Icons[indexPath.row])
        return cell
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
      return  1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 48
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
