//
//  JournalEntry.swift
//  LGListScene
//
//  Created by Apple on 2017/11/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

import Foundation

class JournalEntry: NSObject,DateSortable {

    let date : Date
    let text : String
    let user : User
    
    init(date:Date,text:String,user:User) {
        self.date = date
        self.text = text
        self.user = user
    }
}
