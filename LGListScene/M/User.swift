//
//  User.swift
//  LGListScene
//
//  Created by Apple on 2017/11/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

import Foundation

class User: NSObject {

    let name:String
    let id : Int

    init(id:Int,name:String) {
        self.id = id
        self.name = name
    }
}
