//
//  Pathfinder.swift
//  LGListScene
//
//  Created by Apple on 2017/11/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

protocol PathfinderDelegate {
    func pathfinderDidUpdateMessage(pathfinder:Pathfinder)
}

private func delay(time:Double = 1,execute work: @escaping () -> Void){
    
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
        work()
    }
}

class Pathfinder{

    var delegate:PathfinderDelegate?
    var messages : [Message] = {
        var array = [Message]()
        let user1 = User(id: 5, name: "Angle")
        array.append(Message.init(date: Date(timeIntervalSinceNow: -803200), name: "1.jpg", user: user1))
        array.append(Message.init(date: Date(timeIntervalSinceNow: -1382400), name: "2.jpg", user: user1))
        return array
    }(){
        
        didSet{
            delegate?.pathfinderDidUpdateMessage(pathfinder: self)
        }
    }
    
    func connecton() {
        unowned let weakSelf = self
        delay(time: 2.0) {
            weakSelf.messages.append(Message.init(date: Date(timeIntervalSinceNow: -803200), name: "3.jpg", user: User(id: 5, name: "Angle")))
            
            delay(time: 2.0) {
                weakSelf.messages.append(Message.init(date: Date(timeIntervalSinceNow: -803200), name: "4.jpg", user: User(id: 5, name: "Angle")))
            }
            
        }
    }
}
