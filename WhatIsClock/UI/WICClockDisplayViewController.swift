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
    var viewL, viewM, viewR : WICClockDispView!
    let LFrame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
    let MFrame = CGRect(x: SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
    let RFrame = CGRect(x: SCREEN_WIDTH+SCREEN_WIDTH, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
    let CLOCK_TAB_NUM = 3

    required init?(coder aDecoder: NSCoder) {
        scrollView = UIScrollView(frame: UIScreen.mainScreen().bounds)
        viewL = WICClockDispView.initFromNib() as! WICClockDispView
        viewM = WICClockDispView.initFromNib() as! WICClockDispView
        viewR =  WICClockDispView.initFromNib() as! WICClockDispView

        super.init(coder: aDecoder)
//        #if DEBUG //宏
//            
//        #endif
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadScrollViews()
        
        
    }
    
    func loadScrollViews(){
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: SCREEN_WIDTH * Double(CLOCK_TAB_NUM), height: SCREEN_HEIGHT)
        scrollView.backgroundColor = UIColor.orangeColor()
        scrollView.pagingEnabled = true
        
        viewL.frame = LFrame
        viewM.frame = MFrame
        viewR.frame = RFrame
        viewL.backgroundColor = UIColor.redColor()
        viewM.backgroundColor = UIColor.greenColor()
        viewR.backgroundColor = UIColor.blueColor()
        scrollView.addSubview(self.viewL)
        scrollView.addSubview(self.viewM)
        scrollView.addSubview(self.viewR)
        
        scrollView.scrollRectToVisible(viewM.frame, animated: false)
        view.addSubview(self.scrollView)
    }
//MARK: -   scrollviewDelegate
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print(scrollView.contentOffset)
//        if scrollView.contentOffset.x >
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        if Double(scrollView.contentOffset.x) > scrollView.width{
            print(" this is right flip")
            flipRight()
        }else{
            print("this is left flip")
            flipLeft()
        }
    }
    
    func flipRight(){
        (viewL, viewM, viewR) = (viewM, viewR, viewL)
        (viewL.frame, viewM.frame, viewR.frame) = (LFrame, MFrame, RFrame)
        scrollView.scrollRectToVisible(MFrame, animated: false)
    }
    
    func flipLeft(){
        (viewL, viewM, viewR) = (viewR, viewL, viewM)
        (viewL.frame, viewM.frame, viewR.frame) = (LFrame, MFrame, RFrame)
        scrollView.scrollRectToVisible(MFrame, animated: false)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

