//
//  WICClockDispView.swift
//  WhatIsClock
//
//  Created by LyonTK on 11/26/15.
//  Copyright © 2015 LyonTK. All rights reserved.
//
/*  从xib文件加载view
1.file owner不要改，改最底层view变成 custom view
2.函数调用过程：init?(coder) --   awakeAfterUsingCodeer()   -- awakefromnib()
3.outlet是在awake之后才有值的，之前都是nil


*/
import Foundation
import UIKit

class WICClockDispView:  UIView, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var bannerImgView: UIImageView!
    
    @IBOutlet weak var clocksTableView: UITableView!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func awakeAfterUsingCoder(aDecoder: NSCoder) -> AnyObject? {
        return super.awakeAfterUsingCoder(aDecoder)
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        return
    }
    
}
