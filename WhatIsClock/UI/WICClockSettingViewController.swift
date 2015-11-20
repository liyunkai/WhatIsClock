//
//  WICClockSettingViewController.swift
//  WhatIsClock
//
//  Created by LyonTK on 11/17/15.
//  Copyright © 2015 LyonTK. All rights reserved.
//

import UIKit

class WICClockSettingViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onRegisterClockBtnHit(sender: AnyObject) {
        let timeSetted = self.datePicker!.date.dateByAddingTimeInterval(10)
        self.timeLabel.text = String(timeSetted)
//        WICTTS.speak(Txt: self.timeLabel.text!)
        let model:WICClockSettingModel = WICClockSettingModel(fireDate: timeSetted, isRepeat: false, soundID: "oneSound")
        WICNotificationManager.registerClock(model)
    }


}
