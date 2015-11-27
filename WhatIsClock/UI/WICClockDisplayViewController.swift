//
//  WICClockDisplayViewController.swift
//  WhatIsClock
//
//  Created by LyonTK on 11/17/15.
//  Copyright © 2015 LyonTK. All rights reserved.
//

import UIKit

class WICClockDisplayViewController: UIViewController, UIScrollViewDelegate {
    
    let scrollView:UIScrollView!
    let viewL, viewM, viewR : WICClockDispView!
    
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height
    let CLOCK_TAB_NUM = 3

    required init?(coder aDecoder: NSCoder) {
        self.scrollView = UIScrollView(frame: UIScreen.mainScreen().bounds)
        self.viewL = WICClockDispView.initFromNib() as! WICClockDispView
        self.viewM = WICClockDispView.initFromNib() as! WICClockDispView
        self.viewR =  WICClockDispView.initFromNib() as! WICClockDispView
//        self.viewM =  NSBundle.mainBundle().loadNibNamed("WICClockDispView", owner: nil, options: nil)[0] as! WICClockDispView

        super.init(coder: aDecoder)
//        #if DEBUG //宏
//            
//        #endif
    }
    
//    convenience init(){
//        self.init(nibName: nil, bundle:nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.scrollView.delegate = self
        scrollView.contentSize = CGSize(width: SCREEN_WIDTH * CGFloat(CLOCK_TAB_NUM), height: SCREEN_HEIGHT)
        scrollView.backgroundColor = UIColor.orangeColor()
        
        self.viewL.frame = CGRect(x: 0, y: 0, width: self.scrollView.width, height: self.scrollView.height)
        self.viewM.frame = CGRect(x: self.viewL.right, y: 0, width: self.scrollView.width, height: self.scrollView.height)
        self.viewR.frame = CGRect(x: self.viewM.right, y: 0, width: self.scrollView.width, height: self.scrollView.height)
        self.viewL.backgroundColor = UIColor.redColor()
        self.viewM.backgroundColor = UIColor.greenColor()
        self.viewR.backgroundColor = UIColor.blueColor()
        scrollView.addSubview(self.viewL)
        scrollView.addSubview(self.viewM)
        scrollView.addSubview(self.viewR)
        self.view.addSubview(self.scrollView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

