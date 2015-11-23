//
//  WICClockSettingModel.swift
//  WhatIsClock
//
//  Created by LyonTK on 11/17/15.
//  Copyright © 2015 LyonTK. All rights reserved.
//

import Foundation

class WICClockSettingModel{
    let fireDate:NSDate?
    let isRepeat:Bool?
    let soundID:String?
    let loop:NSCalendarUnit?
    let isTaskOn:Bool?//闹钟任务是否开启
    let message:String?
    let isVerbose:Bool?
    
    init(fireDate:NSDate, isRepeat:Bool, soundID:String, loop:NSCalendarUnit, isTaskOn:Bool, message:String, isVerbose:Bool) {
        self.fireDate = fireDate
        self.isRepeat = isRepeat
        self.soundID = soundID
        self.loop = loop
        self.isTaskOn = isTaskOn
        self.message = message
        self.isVerbose = isVerbose
    }
}
