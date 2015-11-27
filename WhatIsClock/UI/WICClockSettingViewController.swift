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
    @IBOutlet weak var timeLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        selectRing()
        
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
        let timeSetted = self.datePicker!.date.dateByAddingTimeInterval(10)
        self.timeLabel.text = String(timeSetted)
//        WICTTS.speak(Txt: self.timeLabel.text!)
        let model:WICClockSettingModel = WICClockSettingModel(fireDate: timeSetted, isRepeat: false, soundID: "oneSound", loop: NSCalendarUnit.Minute, isTaskOn: true, message: String.localizedStringWithFormat("%@", timeSetted), isVerbose: true)
        WICNotificationManager.registerClock(model)
    }


}

