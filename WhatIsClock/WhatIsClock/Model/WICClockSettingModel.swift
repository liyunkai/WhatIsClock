//
//  WICClockSettingModel.swift
//  WhatIsClock
//
//  Created by LyonTK on 11/17/15.
//  Copyright © 2015 LyonTK. All rights reserved.
//

import Foundation

class WICClockSettingModel{
    var fireDate:NSDate?
    var isRepeat:Bool?
    var soundID:String?
    
    init(fireDate:NSDate, isRepeat:Bool, soundID:String) {
        self.fireDate = fireDate
        self.isRepeat = isRepeat
        self.soundID = soundID
    }
}
