//
//  ProductSelectedCell.swift
//  iOSTemplate
//
//  Created by Ahmed Abu Shammala on 9/11/17.
//  Copyright © 2017 UnitOne. All rights reserved.
//

import UIKit

protocol AJToTableViewCellDelegate :NSObjectProtocol {
    
    //代理方法
    func clickTransmitData(_ cell:ProductSelectedCell ,icon: UIImageView)
    
}

class ProductSelectedCell: UICollectionViewCell {
    
    weak var delegate: AJToTableViewCellDelegate?


    @IBOutlet weak var ProductImage: UIImageView!
    
    @IBOutlet weak var TotalPricelbl: UILabel!
    @IBOutlet weak var CountLbl: UILabel!
    var Counter = Int()
    @IBOutlet weak var AddBtn: UIButton!
    @IBOutlet weak var RemoveBtn: UIButton!
    
    @IBOutlet weak var BigView: UIView!
    
//    override func
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layer.cornerRadius = 5

//        self.ProductImage.tintColor = UIColor.white

//
        
//        UIView.animate(withDuration: 1.0, delay: 0.2, options: [], animations: {() -> Void in
//            self.BigView.backgroundColor = UIColor(netHex: GreenColor)
//        }, completion: {(_ finished: Bool) -> Void in
//            print("Color transformation Completed")
//            self.BigView.backgroundColor = UIColor.yellow
//
//        })
        
//         var color1 = UIColor.clear
//         var color2 = UIColor.red
//         func animateCell(_ cell: UITableViewCell) {
//            
//            UIView.animate(withDuration: 1.0, delay: 0.0, options: [.transitionCrossDissolve, .allowAnimatedContent], animations: {
//                cell.contentView.backgroundColor = color2
//            }) { (_) in
//                UIView.animate(withDuration: 1.0, animations: {
//                    cell.contentView.backgroundColor = color1
//                })
//            }
//            
//        }
//        


//        UIView.animate(withDuration: 1.0, delay: 0.0, options:[.repeat, .autoreverse], animations: {
//            self.BigView.backgroundColor = UIColor(netHex: GreenColor)
//
//        }) { (Bool) in
//            self.BigView.backgroundColor = UIColor(netHex: GreenColor)
//
//        }
        
//        UIView.animate(withDuration: 0.5, animations: { () -> Void in
//            self.BigView.backgroundColor = UIColor(red: 238/255.0, green: 238/255.0, blue: 80/255.0, alpha: 1.0)
//        })
//        
//        UIView.animate(withDuration: 0.5, animations: { () -> Void in
//            self.BigView.backgroundColor = UIColor.red
//        })
        
        
//        contentView.addSubview(iconView)

    }
    
     func addCarButtonClick(_ btn:UIButton) {

        //传输值
        delegate?.clickTransmitData(self, icon: ProductImage)
        
    }
    
    // MARK: - 属性懒加载
//     var iconView: UIImageView = {
//        let iconView = UIImageView()
//        //圆角
//        iconView.layer.cornerRadius = 30
//        //裁剪模式
//        iconView.layer.masksToBounds = true
//        return iconView
//    }()

}
