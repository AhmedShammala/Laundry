//
//  ProductCell.swift
//  LaundryX
//
//  Created by Ahmed Abu Shammala on 3/3/18.
//  Copyright © 2018 UnitOne. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {

    @IBOutlet weak var ProductTitlelbl: UILabel!
    @IBOutlet weak var ProductPricelbl: UILabel!
    
    @IBOutlet weak var ProductImage: UIImageView!
    
    
    @IBOutlet weak var CountLbl: UILabel!
    var Counter = Int()
    @IBOutlet weak var AddBtn: UIButton!
    @IBOutlet weak var RemoveBtn: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.ProductImage.tintColor = UIColor(netHex:"b3b3b3")

        self.layer.cornerRadius = 5
        // Initialization code
        
    }

}
