//
//  JournalSectionController.swift
//  LGListScene
//
//  Created by Apple on 2017/11/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit
import IGListKit
class JournalSectionController: ListSectionController {

    var entry: JournalEntry!
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
    }
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        
        guard let context = collectionContext, let entry = entry else { return .zero }
        let width = context.containerSize.width
        return JournalEntryCell.cellSize(width: width, text: entry.text)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        
        let cell = collectionContext?.dequeueReusableCell(of: JournalEntryCell.self, for: self, at: index)
        if let cell = cell as? JournalEntryCell{
            cell.label.text = entry.text
            cell.titleLabel.text = entry.user.name
        }
        return cell!
    }
    
    override func didUpdate(to object: Any) {
        entry = object as? JournalEntry
    }
    
    override func didSelectItem(at index: Int) {
        
    }
}
