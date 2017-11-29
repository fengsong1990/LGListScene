//
//  Message.swift
//  LGListScene
//
//  Created by Apple on 2017/11/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class Message: NSObject,DateSortable {

    let date : Date
    let name : String
    let user : User
    
    init(date:Date,name:String,user:User) {
        self.date = date
        self.name = name
        self.user = user
    }
}
