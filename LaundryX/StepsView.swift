//
//  StepsView.swift
//  LaundryX
//
//  Created by Ahmed Abu Shammala on 3/10/18.
//  Copyright © 2018 UnitOne. All rights reserved.
//

import UIKit

class StepsView: UIView {

    @IBOutlet weak var StepsView: UIView!

    @IBOutlet weak var NextBtn: UIButton!
    
    override func draw(_ rect: CGRect) {
        
        // Drawing code
        
        self.NextBtn.layer.cornerRadius = 5
        self.NextBtn.clipsToBounds = true
    }
    func Apply(title : String ,Page : Int)
    {
        self.NextBtn.setTitle(title, for: UIControlState.normal)
        
        print(self.StepsView.subviews[0].subviews)
        for view in self.StepsView.subviews[0].subviews {
            
            view.layer.cornerRadius = 3
            view.clipsToBounds = true
            print(view.tag)
            if(view.tag <= Page && view.tag > 0)
            {
                view.backgroundColor = UIColor(netHex: PinkColor)
                view.alpha = 1.0
            }
        }
    }
    
    override init(frame: CGRect) {
        
        // Call super init
        
        super.init(frame: frame)
        
        // 3. Setup view from .xib file
        
        

        
        configureXIB()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        
        configureXIB()
        
    }
    
    func configureXIB() {
        
        StepsView = configureNib()
        
        // use bounds not frame or it’ll be offset
        
        StepsView.frame = bounds
        
        // Make the flexible view

        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        
        addSubview(StepsView)
        
    }
    
    func configureNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        
        let nib = UINib(nibName: "StepsView", bundle: bundle)
        
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
        
    }
    

    

}
