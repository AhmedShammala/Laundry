//
//  DeliveryController.swift
//  LaundryX
//
//  Created by Ahmed Abu Shammala on 3/10/18.
//  Copyright © 2018 UnitOne. All rights reserved.
//

import UIKit

class DeliveryController: UIViewController,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var Layout2: UICollectionViewFlowLayout!
    @IBOutlet weak var Layout: UICollectionViewFlowLayout!
    @IBOutlet weak var TimeCollection: UICollectionView!
    @IBOutlet weak var MyStepView: StepsView!
    var Selected = Int()
    var SelectedTime = Int()
    
    @IBOutlet weak var CollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.animateRandom()

        self.CollectionView.register(UINib(nibName: "LocationCell", bundle: nil), forCellWithReuseIdentifier: "LocationCell")
        
        self.TimeCollection.register(UINib(nibName: "TimeCell", bundle: nil), forCellWithReuseIdentifier: "TimeCell")
        
        self.Layout.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        self.Layout2.estimatedItemSize = UICollectionViewFlowLayoutAutomaticSize
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.MyStepView.Apply(title: "Next", Page: 3)
        self.MyStepView.NextBtn.addTarget(self, action: #selector(self.NextPage), for: .touchUpInside)
    }
    func NextPage()
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CheckOutController") as? CheckOutController
        self.navigationController?.pushViewController(vc!, animated: true)
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 10
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return    1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == CollectionView)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LocationCell", for: indexPath) as! LocationCell
            //        cell.ProductImage.tintColor = UIColor(netHex:"b3b3b3")
            
            if(indexPath.row == Selected)
            {
                cell.BigView.backgroundColor = UIColor(netHex:"538ea6")
                cell.Locationlbl.textColor = UIColor.white
            }else
            {
                cell.BigView.backgroundColor = UIColor.white
                cell.Locationlbl.textColor = UIColor(netHex:"538ea6")
                
            }
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeCell", for: indexPath) as! TimeCell
        //        cell.ProductImage.tintColor = UIColor(netHex:"b3b3b3")
        
        if(indexPath.row == SelectedTime)
        {
            cell.BigView.backgroundColor = UIColor(netHex:"538ea6")
            cell.Daylbl.textColor = UIColor.white
            cell.Timelbl.textColor = UIColor.white
            
        }else
        {
            cell.BigView.backgroundColor = UIColor.white
            cell.Daylbl.textColor = UIColor(netHex:"538ea6")
            cell.Timelbl.textColor = UIColor(netHex:"538ea6")
            
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath:  IndexPath) -> CGSize {
        
        return CGSize(width: CGFloat(self.CollectionView.frame.size.height) , height: CGFloat(self.CollectionView.frame.size.height))
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(collectionView == CollectionView)
        {
            Selected = indexPath.row
            self.CollectionView.reloadData()
            
        }else
        {
            SelectedTime = indexPath.row
            self.TimeCollection.reloadData()
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

