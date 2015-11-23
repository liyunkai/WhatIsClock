//
//  WICNotificationManager.swift
//  WhatIsClock
//
//  Created by LyonTK on 11/18/15.
//  Copyright © 2015 LyonTK. All rights reserved.
//

import Foundation
import UIKit

let NOTIF_PROMOTE_SET_ALERT_TYPE_AND_SOUND = "NOTIF_PROMOTE_SET_ALERT_TYPE_AND_SOUND"
let NOTIF_ACTION_LAUNCH_APP = "NOTIF_ACTION_LAUNCH_APP"
let NOTIF_CATEGORY_TIMEUP_CLOCK = "NOTIF_CATEGORY_TIMEUP_CLOCK"

class WICNotificationManager {
    
    class func registerNotificationTypeOnLaunch(){

        let currentNotifSettings: UIUserNotificationSettings! = UIApplication.sharedApplication().currentUserNotificationSettings()
        if !currentNotifSettings.types.contains([.Alert, .Sound, .Badge]) {//数组应该用contains方法，不能直接 ==
            //types
            let notifTypes: UIUserNotificationType = UIUserNotificationType([.Alert, .Sound, .Badge])//结构体的组合要用 结构体名([数组])的形式声明
            //actions
            let onlyAction = UIMutableUserNotificationAction()
            onlyAction.identifier = NOTIF_ACTION_LAUNCH_APP
            onlyAction.title = NSLocalizedString("好的", comment: "闹钟响了之后关闹钟的按钮")
            onlyAction.activationMode = UIUserNotificationActivationMode.Foreground
            onlyAction.destructive = false
            onlyAction.authenticationRequired = false
            //category
            let actionArray = [onlyAction]
            let actionArrayMinimal = [onlyAction]
            let notifCategory = UIMutableUserNotificationCategory()
            notifCategory.identifier = NOTIF_CATEGORY_TIMEUP_CLOCK
            notifCategory.setActions(actionArray, forContext: UIUserNotificationActionContext.Default)
            notifCategory.setActions(actionArrayMinimal, forContext: UIUserNotificationActionContext.Minimal)
            //注册
            let notifSetting = UIUserNotificationSettings(forTypes: notifTypes, categories: [notifCategory])
            UIApplication .sharedApplication().registerUserNotificationSettings(notifSetting)
            //提示的通知
            NSNotificationCenter.defaultCenter().postNotificationName(NOTIF_PROMOTE_SET_ALERT_TYPE_AND_SOUND, object: nil)//提醒用户打开声音和alert窗口//后期要加不再弹出等让用户选择的，避免用户厌恶
        }
    }
    
    class func handleLaunchOptions(launchOptions: [NSObject: AnyObject]?){
        if let clockNotif  = launchOptions?[UIApplicationLaunchOptionsLocalNotificationKey] as? UILocalNotification{
            WICNotificationManager.handleClockNotification(clockNotif)
        
        }
    }
    
    class func handleClockNotification(clockNotif: UILocalNotification) {
        WICTTS.speak(Txt: String(clockNotif.fireDate!))
        WICNotificationManager.clearAllClocks()
    }
    
    class func registerClock(model: WICClockSettingModel){
        let clockNotif = UILocalNotification()
        clockNotif.fireDate = model.fireDate
        clockNotif.repeatInterval = model.loop!
        clockNotif.timeZone = NSTimeZone()
        clockNotif.alertBody = model.message
        clockNotif.alertAction = NSLocalizedString("戳这里", comment: "闹钟响了之后关闹钟的按钮")
        clockNotif.soundName = UILocalNotificationDefaultSoundName//目前是默认提示音
        if #available(iOS 8.2, *) {
            clockNotif.alertTitle = model.soundID
        } else {
            // Fallback on earlier versions
        }
        
        //        clockNotif.timeZone
        //set category,绑定闹钟动作//设置category会使得alertview上为 "取消，选项"
//        clockNotif.category = NOTIF_CATEGORY_TIMEUP_CLOCK
        UIApplication.sharedApplication().scheduleLocalNotification(clockNotif)
    }
    
    class func clearAllClocks() {
        UIApplication.sharedApplication().cancelAllLocalNotifications()
    }
}