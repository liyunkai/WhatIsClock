//
//  WICClockSettingModel.swift
//  WhatIsClock
//
//  Created by LyonTK on 11/17/15.
//  Copyright © 2015 LyonTK. All rights reserved.
//

import Foundation
import SQLite

class WICClockSettingModel{
    var fireDate:NSDate?
    var soundID:String?
    var isRepeat:Bool?//是否重复，与loop结合起来用
    var loop:NSCalendarUnit?
    var isTaskOn:Bool?//闹钟任务是否开启
    var message:String?
    var isVerbose:Bool?
    
    init(fireDate:NSDate, isRepeat:Bool, soundID:String, loop:NSCalendarUnit, isTaskOn:Bool, message:String, isVerbose:Bool) {
        self.fireDate = fireDate
        self.isRepeat = isRepeat
        self.soundID = soundID
        self.loop = loop
        self.isTaskOn = isTaskOn
        self.message = message
        self.isVerbose = isVerbose
    }
    
    func test(){//guard // do try catch //  func() throws -> TYPE  //defer{} 做在return之前的收尾工作
        do{
            _ = try Connection("db.sqlite3")
            _ = Table("dailyClocks")
        }catch{
            return
        }
    }
}
