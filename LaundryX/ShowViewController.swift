//
//  ShowViewController.swift
//  HomeFix
//
//  Created by Omar Al tawashi on 2/24/16.
//  Copyright ©  2016 unitone itc. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {

    @IBOutlet weak var SignUpBtn: UIButton!
    @IBOutlet weak var SignBtn: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var bottomPageControlConstaints: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        
        makeUI()
        
        // Do any additional setup after loading the view.
    }

    @IBOutlet fileprivate weak var scrollView: UIScrollView!
    
    @IBOutlet fileprivate weak var pageControl: CustomPageControl!
    
    
    fileprivate var isFirstAppear = true
    
    fileprivate var steps = [UIViewController]()
    
    @IBAction func SginupAction(_ sender: Any)
    {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignupTableController") as? SignupTableController
//        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func LoginAction(_ sender: Any)
    {
        
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignInControoler") as? SignInControoler
//        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        


        self.SignBtn.DrawShadow()
        self.SignUpBtn.DrawShadow()

//        self.SignBtn.layer.shadowColor = UIColor.gray.cgColor
//        self.SignBtn.layer.shadowOffset = CGSize(width: 1, height: 1)
//        self.SignBtn.layer.shadowOpacity = 1
//        self.SignBtn.layer.shadowRadius = 1.0
//
//        self.SignUpBtn.layer.shadowColor = UIColor.gray.cgColor
//        self.SignUpBtn.layer.shadowOffset = CGSize(width: 1, height: 1)
//        self.SignUpBtn.layer.shadowOpacity = 1
//        self.SignUpBtn.layer.shadowRadius = 1.0
        
        
//        self.SignBtn.draw(self.SignUpBtn.frame)
//        self.SignBtn.draw(self.SignUpBtn.frame)

        navigationController?.setNavigationBarHidden(true, animated: true)
        
        if isFirstAppear {
            scrollView.alpha = 0
            pageControl.alpha = 0
        }
      
        }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isFirstAppear {
            UIView.animate(withDuration: 0.1, delay: 0.1, options: UIViewAnimationOptions(), animations: { [weak self] in
                self?.scrollView.alpha = 1
                self?.pageControl.alpha = 1
                 }, completion: { _ in })
        }
        
        isFirstAppear = false
    }
    
    fileprivate func makeUI() {
        
        let stepA = stepOne()
        let stepB = stepTwo()
        let stepC = stepThree()
        
        steps = [stepA, stepB, stepC]
        
        pageControl.numberOfPages = steps.count
//        pageControl.pageIndicatorTintColor = UIColor.yepBorderColor()
//        pageControl.currentPageIndicatorTintColor = UIColor.yepTintColor()
//        
        
        let viewsDictionary = [
            "view": view,
            "stepA": stepA.view,
            "stepB": stepB.view,
            "stepC": stepC.view,
        ]
        
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[stepA(==view)]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary)
        
        NSLayoutConstraint.activate(vConstraints)
        
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[stepA(==view)][stepB(==view)][stepC(==view)]|", options: [.alignAllBottom, .alignAllTop], metrics: nil, views: viewsDictionary)
        
        NSLayoutConstraint.activate(hConstraints)
    }
    
    fileprivate func stepOne() -> ShowStepOneViewController {
 
        let step = storyboard!.instantiateViewController(withIdentifier: "ShowStepOneViewController") as! ShowStepOneViewController
        
        step.view.translatesAutoresizingMaskIntoConstraints = false
        step.textlbl.text = "Lorem ipsum dolor sit amet, consectetcur adipiscing elit, sed do eiusmod"
        scrollView.addSubview(step.view)
        
        addChildViewController(step)
        step.didMove(toParentViewController: self)
        
        return step
    }
    
    fileprivate func stepTwo() -> ShowStepOneViewController {
        let step = storyboard!.instantiateViewController(withIdentifier: "ShowStepOneViewController") as! ShowStepOneViewController
        
        step.view.translatesAutoresizingMaskIntoConstraints = false
        step.textlbl.text = "Lorem ipsum dolor sit amet, consectetcur adipiscing elit, sed do eiusmod"
        step.BGImage.image = UIImage(named : "intro3")
        scrollView.addSubview(step.view)
        
        addChildViewController(step)
        step.didMove(toParentViewController: self)
        
        return step
    }
    
    fileprivate func stepThree() -> ShowStepOneViewController {
        let step = storyboard!.instantiateViewController(withIdentifier: "ShowStepOneViewController") as! ShowStepOneViewController
        
        step.view.translatesAutoresizingMaskIntoConstraints = false
        step.textlbl.text = "Lorem ipsum dolor sit amet, consectetcur adipiscing elit, sed do eiusmod"
        step.BGImage.image = UIImage(named : "intro2")

        scrollView.addSubview(step.view)
        
        addChildViewController(step)
        step.didMove(toParentViewController: self)
        
        return step
    }
    
 
 
    
}

// MARK: - UIScrollViewDelegate

extension ShowViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let pageWidth = scrollView.bounds.width
        let pageFraction = scrollView.contentOffset.x / pageWidth
        
        let page = Int(round(pageFraction))
        
        pageControl.currentPage = page
    }
}
