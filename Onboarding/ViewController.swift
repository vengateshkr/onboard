//
//  ViewController.swift
//  Onboarding
//
//  Created by Venkatesh on 15/08/18.
//  Copyright © 2018 Venkatesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var skipButton: UIButton!

    let underLineAttrs : [NSAttributedStringKey : Any] = [
        NSAttributedStringKey.font : UIFont.systemFont(ofSize: 19.0),
        NSAttributedStringKey.foregroundColor : UIColor.green,
        NSAttributedStringKey.backgroundColor : UIColor.clear,
        NSAttributedStringKey.underlineStyle : NSUnderlineStyle.styleSingle.rawValue
    ]
    
    let non_underLineAttrs : [NSAttributedStringKey : Any] = [
        NSAttributedStringKey.font : UIFont.systemFont(ofSize: 19.0),
        NSAttributedStringKey.foregroundColor : UIColor.green,
        NSAttributedStringKey.backgroundColor : UIColor.clear
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.layoutSubviews()
        self.view.layoutIfNeeded()

        widthConstraint.constant = scrollView.frame.width * 3
        scrollView?.contentSize = CGSize(width: widthConstraint.constant, height: (scrollView?.frame.height)!)
        
        let boldString = NSMutableAttributedString(string: "Skip", attributes: underLineAttrs)
        skipButton.setAttributedTitle(boldString, for: .normal)
        skipButton.backgroundColor = .clear

    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageNumber)

        let boldString = NSMutableAttributedString(string: "Skip", attributes: underLineAttrs)
        let getStartedString = NSMutableAttributedString(string: "Get started", attributes: non_underLineAttrs)

        if pageNumber == 2 {
            skipButton.setAttributedTitle(getStartedString, for: .normal)
            skipButton.backgroundColor = .white
        } else {
            skipButton.setAttributedTitle(boldString, for: .normal)
            skipButton.backgroundColor = .clear
        }
        
    }


    @IBAction func onbViewbuttonAction(_ sender: UIButton!) {
        print("acted")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

