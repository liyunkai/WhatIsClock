//
//  WICClockDispView.swift
//  WhatIsClock
//
//  Created by LyonTK on 11/26/15.
//  Copyright © 2015 LyonTK. All rights reserved.
//

import Foundation
import UIKit

class WICClockDispView:  UIView, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var bannerImgView: UIImageView!
    
    @IBOutlet weak var clocksTableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.awakeFromNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
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
