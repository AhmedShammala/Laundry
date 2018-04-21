//
//  CheckOutController.swift
//  LaundryX
//
//  Created by Ahmed Abu Shammala on 3/24/18.
//  Copyright © 2018 UnitOne. All rights reserved.
//

import UIKit

class CheckOutController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout ,UITableViewDataSource, UITableViewDelegate{
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var MyStepView: StepsView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.animateRandom()

        // Do any additional setup after loading the view.
        
        self.CollectionView.register(UINib(nibName: "ProductSelectedCell", bundle: nil), forCellWithReuseIdentifier: "ProductSelectedCell")

        self.TableView.register(UINib(nibName: "SelectCell", bundle: nil), forCellReuseIdentifier: "SelectCell")
        self.TableView.register(UINib(nibName: "TextCell", bundle: nil), forCellReuseIdentifier: "TextCell")

        self.TableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.MyStepView.Apply(title: "Next", Page: 4)
        self.MyStepView.NextBtn.addTarget(self, action: #selector(self.NextPage), for: .touchUpInside)
    }
    func NextPage()
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "OrderPreviewController") as? OrderPreviewController
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

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductSelectedCell", for: indexPath) as! ProductSelectedCell
            cell.layer.cornerRadius = 5
            cell.ProductImage.tintColor = UIColor.white
            
            cell.AddBtn.tag = indexPath.row
            cell.RemoveBtn.tag = indexPath.row

            cell.BigView.backgroundColor = UIColor(netHex: "538ea6")
            
//            if(SelectedIndex == indexPath.row)
//            {
//                cell.BigView.backgroundColor = UIColor.init(netHex: "538ea6")
//
//                DispatchQueue.main.async{
//                    UIView.animate(withDuration: 1.0, delay: 0.1, options:[.repeat,.autoreverse,.allowUserInteraction], animations: {
//                        cell.BigView.backgroundColor = UIColor(netHex: "538ea6")
//                        cell.ProductImage.tintColor = UIColor.white
//                    }, completion:nil)
//                }
//            }
            cell.ProductImage.tintColor = UIColor.white
            
            return cell
            
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath:  IndexPath) -> CGSize {
        
        return CGSize(width: CGFloat((self.CollectionView.frame.size.width / 2.5) - 10) , height: CGFloat((self.CollectionView.frame.size.height)))
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(section == 0)
        {
            return 1
        }
        return 4
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return 15
    }
    func numberOfSections(in tableView: UITableView) -> Int {
       return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectCell", for: indexPath) as! SelectCell
            
            
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextCell
        
        
        return cell
        
        
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
