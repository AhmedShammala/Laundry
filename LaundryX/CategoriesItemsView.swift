//
//  CategoriesItemsView.swift
//  LaundryX
//
//  Created by Ahmed Abu Shammala on 3/3/18.
//  Copyright © 2018 UnitOne. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import SDWebImage
import ViewAnimator

class CategoriesItemsView: UIViewController,UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout,IndicatorInfoProvider {

    private let animations = [AnimationType.from(direction: .bottom, offset: 30.0)]

    @IBOutlet weak var CollectionView: UICollectionView!
    
    @IBOutlet weak var MyStepView: StepsView!
    var itemInfo: IndicatorInfo = "Category"
    var SelectedIndex = -1

    
    init(itemInfo: IndicatorInfo) {
        self.itemInfo = itemInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    func ShowAnimaited()
    {
        CollectionView?.reloadData()
        CollectionView?.performBatchUpdates({
            self.CollectionView?.animateViews(animations: animations,
                                              completion: {
            })
        }, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        

        self.MyStepView.Apply(title: "Next", Page: 1)
        self.MyStepView.NextBtn.addTarget(self, action: #selector(self.NextPage), for: .touchUpInside)
    }
    
    func NextPage()
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PickupController") as? PickupController
        

//        let nav = UINavigationController(rootViewController: self.navigationController!)
        self.navigationController?.navigationController?.pushViewController(vc!, animated: true)

//        var rootViewController = self.navigationController?.viewControllers


    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.CollectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
        
        self.CollectionView.register(UINib(nibName: "ProductSelectedCell", bundle: nil), forCellWithReuseIdentifier: "ProductSelectedCell")
        // Do any additional setup after loading the view.
        
        self.ShowAnimaited()

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
        
        if(SelectedIndex == indexPath.row)
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductSelectedCell", for: indexPath) as! ProductSelectedCell
//            cell.ProductImage.sd_setImage(with: URL(string: ""), placeholderImage: UIImage(named: "PlaceHolder")?.withRenderingMode(.alwaysTemplate),options: SDWebImageOptions())
//            { (img:UIImage?, err:Error?, SDImageCacheType, url:URL?) in
//
//                if((img) != nil){
//                    cell.ProductImage.image = img?.withRenderingMode(.alwaysTemplate)
//                    cell.ProductImage.tintColor = UIColor(netHex:"b3b3b3")
//
//                }
//
//            }
//
            cell.ProductImage.tintColor = UIColor.white

            cell.AddBtn.tag = indexPath.row
            cell.RemoveBtn.tag = indexPath.row
//            cell.AddBtn.addTarget(self, action: #selector(self.AddItem), for: .touchUpInside)
//            cell.RemoveBtn.addTarget(self, action: #selector(self.RemoveItem), for: .touchUpInside)
//
//
//
//            cell.CountLbl.text = item.count
            
            
//            cell.TotalPricelbl.text = "$ \(item.price) x $ \(item.count) = $ \(Double(item.price)! * Double(item.count)!)"
            
            //                cell.delegate = self
            cell.BigView.backgroundColor = UIColor(netHex: "538ea6")
            
            if(SelectedIndex == indexPath.row)
            {
                cell.BigView.backgroundColor = UIColor.init(netHex: "538ea6")
                
                DispatchQueue.main.async{
                    UIView.animate(withDuration: 1.0, delay: 0.1, options:[.repeat,.autoreverse,.allowUserInteraction], animations: {
                        cell.BigView.backgroundColor = UIColor(netHex: "538ea6")
                        cell.ProductImage.tintColor = UIColor.white
                    }, completion:nil)
                }
            }
            cell.ProductImage.tintColor = UIColor.white

            return cell
            
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
//        cell.ProductImage.sd_setImage(with: URL(string: ""), placeholderImage: UIImage(named: "PlaceHolder"))
        cell.ProductImage.tintColor = UIColor(netHex:"b3b3b3")

//        cell.ProductTitlelbl.text = item.name
//        cell.ProductPricelbl.text = "$ \(item.price)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath:  IndexPath) -> CGSize {
        
        //        return CGSize(width: CGFloat(self.view.frame.size.width / 3) , height: CGFloat((153)))
        return CGSize(width: CGFloat((self.CollectionView.frame.size.width / 2) - 10) , height: CGFloat((self.CollectionView.frame.size.width / 2) - 10))
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.ShowAnimaited()
        let cell = collectionView.cellForItem(at: indexPath)
        
        
        self.SelectedIndex = indexPath.row
        self.CollectionView.reloadData()
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [],
                       animations: {
                        cell!.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        },
                       completion: { finished in
                        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: .curveEaseOut,
                                       animations: {
                                        cell!.transform = CGAffineTransform(scaleX: 1, y: 1)
                        },
                                       completion: { (Bool) in
                                        
                        } )})
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
