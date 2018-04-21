//
//  TimeCell.swift
//  LaundryX
//
//  Created by Ahmed Abu Shammala on 3/24/18.
//  Copyright © 2018 UnitOne. All rights reserved.
//

import UIKit

class TimeCell: UICollectionViewCell {

    @IBOutlet weak var Daylbl: UILabel!
    @IBOutlet weak var Timelbl: UILabel!

    @IBOutlet weak var BigView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius =  5

    }

}
