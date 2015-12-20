//
//  WICClockSettingModel.swift
//  WhatIsClock
//
//  Created by LyonTK on 11/17/15.
//  Copyright © 2015 LyonTK. All rights reserved.
//

import Foundation
import SQLite
import UIKit

struct WICClockSettingModel{
    
    var isTaskOn:Bool//闹钟任务是否开启
    var isVerbose:Bool
    var notification : UILocalNotification?//uilocalnotif足够记录闹钟了
    let clockID: Int//创建时的时间戳
    var isOn: Bool//闹钟是开启还是关闭
    let KEY_CLOCK_ID = "CLOCK_ID"
    
    init(clockID: Int, fireDate:NSDate, soundID:String, loop:NSCalendarUnit, isTaskOn:Bool, message:String, isVerbose:Bool) {
        
        isOn = true
        self.isTaskOn = isTaskOn
        self.isVerbose = isVerbose
        self.clockID = clockID
        
        notification = UILocalNotification()
        notification?.fireDate = fireDate
        notification?.soundName = soundID
        notification?.alertBody = message
        notification?.repeatInterval = loop
        if #available(iOS 8.2, *) {
            notification?.alertTitle = "闹钟"
        } else {
            // Fallback on earlier versions
        }
        
        let userinfo = NSDictionary(object: clockID, forKey: KEY_CLOCK_ID)
        notification?.userInfo = userinfo as [NSObject : AnyObject]
        
    }
    
}