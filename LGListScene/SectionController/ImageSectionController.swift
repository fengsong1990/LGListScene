//
//  ImageSectionController.swift
//  LGListScene
//
//  Created by Apple on 2017/11/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

import IGListKit

class ImageSectionController: ListSectionController {

    var message: Message!
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
    }
    
    override func numberOfItems() -> Int {
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        
        guard let context = collectionContext else { return .zero }
        let width = context.containerSize.width
        return CGSize(width: width, height: 100 + inset.bottom)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        
        let cell = collectionContext?.dequeueReusableCell(of: ImageCell.self, for: self, at: index)
        if let cell = cell as? ImageCell{
            cell.imgV.image = UIImage.init(named: "\(message.name)")
        }
        return cell!
    }
    
    override func didUpdate(to object: Any) {
        message = object as? Message
    }
    
    override func didSelectItem(at index: Int) {
        
    }
}
