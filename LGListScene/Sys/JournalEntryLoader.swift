//
//  JournalEntryLoader.swift
//  LGListScene
//
//  Created by Apple on 2017/11/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

import Foundation
import IGListKit
class JournalEntryLoader: NSObject {

    var entries = [JournalEntry]()
    
    func loadLatest() {
        let user1 = User.init(id: 1, name: "江昭和")
        let user2 = User.init(id: 2, name: "萌薇")
        let user3 = User.init(id: 3, name: "月舞倾城")
        let user4 = User.init(id: 4, name: " 桃花红河水胖")
        
        let myEntries = [
            JournalEntry.init(date: Date(timeIntervalSinceNow: -1727283), text: "我闭上眼，仿佛又回到了去年冬季，那个义无反顾的深夜，独自一人穿着厚厚的衣服，走下火车的那一瞬间，清冽爽辣的冷空气像绵实的拥抱将我团团包围，我来不及感叹，来不及戴上一双手套，来不及唱一句「莫斯科没有眼泪，大雪纷飞，你冷得好憔悴」，就走进了哈尔滨深沉皎洁，绚丽沧桑的夜色当中。", user: user1),
            JournalEntry.init(date: Date(timeIntervalSinceNow: -1382400), text: "空空荡荡，广阔陌生的火车站台外，是万紫千红的冰灯，是城市披上的一层流光溢彩的霓虹衣裳，我还来不及拥抱那美轮美奂的灯火，已经一心一意地用双手赤裸裸地亲吻起地面的千堆雪。", user: user2),
            JournalEntry.init(date: Date(timeIntervalSinceNow: -259200), text: "那时候你还在别座城市，凝望着别处风景，呵护着别处的人，那时候的你年轻，意气风发，不肯轻易向生活妥协，胸怀里装着人世间最绮丽的山水，最曲高和寡的爱情，和最黯然消魂的酒。\n\n那时候你我还不曾相逢，像北极的光和南极的熊，像太平洋的蝴蝶和诺曼底的风，像席慕容的细腻柔软和金庸的侠骨铮铮。", user: user3),
            JournalEntry.init(date: Date(timeIntervalSinceNow: -1382400), text: "后来我在一个地方迷路，手机又在冷天里自动关机，行人稀疏，沧桑颓败，残破不堪的建筑围成的巷子里，我一边小心翼翼，诚惶诚恐地走着，一边想着福尔摩斯的故事，想着达芙妮杜穆里埃的小说，想着年少时候做过的噩梦，还想着，二楼的破窗里会不会忽然跳出一只目光炯炯的猫。", user: user4),
            ]
        self.entries = myEntries
    }
}
