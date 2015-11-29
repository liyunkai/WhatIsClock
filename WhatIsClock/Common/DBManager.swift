//
//  DBManager.swift
//  WhatIsClock
//
//  Created by 李允恺 on 11/29/15.
//  Copyright © 2015 LyonTK. All rights reserved.
//

import Foundation
import SQLite

class DBManager {
    
    static let g_db:Connection? = {
        let path = NSSearchPathForDirectoriesInDomains(
                    .DocumentDirectory, .UserDomainMask, true
                    ).first!
        let db =  try! Connection("\(path)/db.sqlite3")//这里crash了怎么办内
        return db
    }()
    
    
    class func cteateTableWithName(tableName:String) {
        guard let db = g_db else{
            print("db error")
            return
        }
        let table = Table(tableName)
        let id = Expression<Int64>("id")
        let name = Expression<String?>("name")
        let email = Expression<String>("email")
        do{
            try db.run(table.create(temporary: false, ifNotExists: true, block: {t in
                t.column(id, primaryKey: true)
                t.column(name)
                t.column(email, unique: true)
                }))
        }
        catch{
            return
        }
    }

    
    
}