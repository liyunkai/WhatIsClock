//
//  WICClockSettingViewController.swift
//  WhatIsClock
//
//  Created by LyonTK on 11/17/15.
//  Copyright © 2015 LyonTK. All rights reserved.
//

import UIKit
import MediaPlayer

class WICClockSettingViewController: UITableViewController, MPMediaPickerControllerDelegate {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var isVerboseSwitch: UISwitch!
    
    @IBOutlet weak var isClockTaskOn: UISwitch!
    
    @IBOutlet weak var ringLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        selectRing()
        
    }
    
    func selectRing(){
        let ringPicker = MPMediaPickerController(mediaTypes: MPMediaType.AnyAudio)
        ringPicker.delegate = self
        ringPicker.prompt = NSLocalizedString("select a ring", comment: "select a ring for clock")
        self .presentViewController(ringPicker, animated: true, completion: nil)
    }
    
    func mediaPicker(mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func mediaPickerDidCancel(mediaPicker: MPMediaPickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onRegisterClockBtnHit(sender: AnyObject) {
        let clockID = Int(NSDate().timeIntervalSince1970)
        let timeSetted = self.datePicker!.date
        let message = messageLabel.text!
        let isclocktaskOn = isClockTaskOn!.on
        let isverbose = isVerboseSwitch!.on
        let ringID = UILocalNotificationDefaultSoundName//ringLabel.text!
        let loop = NSCalendarUnit.Minute
        
        let model:WICClockSettingModel = WICClockSettingModel(clockID: clockID, fireDate: timeSetted, soundID: ringID, loop: loop, isTaskOn: isclocktaskOn, message: message, isVerbose: isverbose)
        WICNotificationManager.registerClock(model)
        WICDBManager.addClock(model, tableName:WICDBManager.TNAME_DAILY_CLOCKS)
    }


}

