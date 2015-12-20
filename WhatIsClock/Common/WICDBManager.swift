//
//  DBManager.swift
//  WhatIsClock
//
//  Created by 李允恺 on 11/29/15.
//  Copyright © 2015 LyonTK. All rights reserved.
//

import Foundation
import SQLite

class WICDBManager {
    
    typealias TNAME = String
    
    static let TNAME_DAILY_CLOCKS = "test_daily"//"TNAME_DAILY_CLOCKS"
    static let TNAME_SPECIAL_CLOCKS    = "test_spec"//"TNAME_SPECIAL_CLOCKS"
    static let TNAME_SCHEDUAL_CLOCKS = "test_sche"//"TNAME_SCHEDUAL_CLOCKS"
    
    static let notifID = Expression<Int64>("notifID")
    static let isTaskOn = Expression<Bool?>("isTaskOn")
    static let isVerbose = Expression<Bool?>("isVerbose")
    static let fireDate = Expression<Int64>("fireDate")
    static let soundName = Expression<String?>("soundName")
    static let message = Expression<String?>("message")
    static let loop = Expression<String?>("loop")
    
    static let g_db:Connection? = {
        let path = NSSearchPathForDirectoriesInDomains(
                    .DocumentDirectory, .UserDomainMask, true
                    ).first!
        let db =  try! Connection("\(path)/db.sqlite3")//这里crash了怎么办内
        print(path)
        return db
    }()
    
    class func prepareDB() {
        createClockTableWithName(TNAME_DAILY_CLOCKS)
        createClockTableWithName(TNAME_SPECIAL_CLOCKS)
        createClockTableWithName(TNAME_SCHEDUAL_CLOCKS)
    }
    
    
    class func createClockTableWithName(tableName:String) {
        guard let db = g_db else{
            print("db create table error")
            return
        }
        
        let table = Table(tableName)
        
        do{
            try db.run(table.create(temporary: false, ifNotExists: true, block: {t in
                t.column(notifID)
                t.column(isTaskOn)
                t.column(isVerbose)
                t.column(fireDate)
                t.column(soundName)
                t.column(message)
                t.column(loop)
                }))
        }
        catch{
            return
        }
    }
    
    class func addClock(model:WICClockSettingModel, tableName:TNAME) {
        guard let db = g_db else{
            print("db add clock error")
            return
        }
        let table = Table(tableName)
        let clockInsert = table.insert(notifID <- 1, fireDate <- 128246, soundName <- "aa", message <- "gagaga")
        do{
            let rowId = try db.run(clockInsert)
            print(rowId)
        }catch{
            print(error)
        }
        for clock in db.prepare(table){
            print("sound \(clock[soundName]) isverbose  firedate \(clock[fireDate]) notifID \(clock[notifID])")
        }
    }
    
    class func deleteClock(table: String, notifID:Int64) {
        
    }

    class func clockList(table:String) -> [WICClockSettingModel]{
        
        
        return [WICClockSettingModel]()
    }
    
    class func invalidClock(table: String, notifID: Int64) -> Bool {
        
        return true
    }
    
}
























