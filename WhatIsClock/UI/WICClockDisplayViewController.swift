//
//  WICClockDisplayViewController.swift
//  WhatIsClock
//
//  Created by LyonTK on 11/17/15.
//  Copyright © 2015 LyonTK. All rights reserved.
//

import UIKit

class WICClockDisplayViewController: UIViewController {
    
    var scrollView:UIScrollView
//    var viewL, viewM, viewR : UIView
    
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height
    let CLOCK_TAB_NUM = 3
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        self.scrollView = UIScrollView(frame: UIScreen.mainScreen().bounds)
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }

    required init?(coder aDecoder: NSCoder) {
        self.scrollView = UIScrollView(frame: UIScreen.mainScreen().bounds)
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
        scrollView.contentSize = CGSize(width: SCREEN_WIDTH * CGFloat(CLOCK_TAB_NUM), height: SCREEN_HEIGHT)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

