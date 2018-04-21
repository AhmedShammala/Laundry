//
//  PreviewCell.swift
//  LaundryX
//
//  Created by Ahmed Abu Shammala on 3/31/18.
//  Copyright © 2018 UnitOne. All rights reserved.
//

import UIKit

class PreviewCell: UITableViewCell {
    @IBOutlet weak var Titlelbl: UILabel!
    @IBOutlet weak var IconImg: UIImageView!
    
    @IBOutlet weak var Valuelbl: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
