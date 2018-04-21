//
//  UIViewExt.swift
//  Template1
//
//  Created by OmarAltawashi on 6/7/17.
//  Copyright © 2017 UnitOne. All rights reserved.
//

import Foundation
import UIKit
import ViewAnimator

extension UIView{
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        
        self.layer.add(animation, forKey: nil)
    }
    
    func clearConstraintsOfSubview(_ subview: UIView) {
        for constraint: NSLayoutConstraint in self.constraints {
            if constraint.firstItem.isEqual(subview) || constraint.secondItem!.isEqual(subview) {
                self.removeConstraint(constraint)
            }
        }
    }
    func DrawShadowView() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        //        self.layer.shadowColor = UIColor.red.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 10.0
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 5
        //        self.clipsToBounds = true
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    public func animateRandom(interval: Double = ViewAnimatorConfig.interval) {
        for (index, view) in subviews.enumerated() {
            let delay = Double(index) * interval
            let animation = AnimationType.random()
            if let animatable = view as? Animatable {
                animatable.animateViews(animations: [animation], delay: delay)
            } else {
                view.animate(animations: [animation], delay: delay)
            }
        }
    }
}
