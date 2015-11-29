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

class WICClockSettingModel{
    
    var isTaskOn:Bool//闹钟任务是否开启
    var isVerbose:Bool
    var notification : UILocalNotification?//uil足够记录闹钟了
    let notifID: Int//时间戳
    var isOn: Bool//闹钟是开启还是关闭
    let KEY_NOTIF_ID = "KEY_NOTIF_ID"
    
    init(fireDate:NSDate, isRepeat:Bool, soundID:String, loop:NSCalendarUnit, isTaskOn:Bool, message:String, isVerbose:Bool) {
        
        isOn = true
        self.isTaskOn = isTaskOn
        self.isVerbose = isVerbose
        notifID = Int(NSDate().timeIntervalSince1970)
        
        notification = UILocalNotification()
        notification?.fireDate = fireDate
        notification?.soundName = soundID
        notification?.alertBody = message
        if #available(iOS 8.2, *) {
            notification?.alertTitle = "闹钟"
        } else {
            // Fallback on earlier versions
        }
        notification?.repeatInterval = loop
        let userinfo = NSDictionary(object: notifID, forKey: KEY_NOTIF_ID)
        notification?.userInfo = userinfo as [NSObject : AnyObject]
        
    }
    
//    class func initWithDBRecord(){
//    
//    }
    
    func test(){//guard // do try catch //  func() throws -> TYPE  //defer{} 做在return之前的收尾工作
        do{
            _ = try Connection("db.sqlite3")
        }catch{
            print("存储空间已满?")
            return
        }
    }
}

class WICDailyClockList {
    let DailyClockList = Table("DailyClockList")
}

class WICSpecialClockList {
    let SpecialClockList = Table("SpecialClockList")
}

class WICSchedualClockList {
     let SchedualClockList = Table("SchedualClockList")
}
