//
//  LocationCell.swift
//  LaundryX
//
//  Created by Ahmed Abu Shammala on 3/10/18.
//  Copyright © 2018 UnitOne. All rights reserved.
//

import UIKit

class LocationCell: UICollectionViewCell {

    @IBOutlet weak var Locationlbl: UILabel!
    @IBOutlet weak var BigView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius =  5
    }

}
