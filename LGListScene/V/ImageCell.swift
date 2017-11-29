//
//  ImageCell.swift
//  LGListScene
//
//  Created by Apple on 2017/11/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit
import SnapKit
class ImageCell: UICollectionViewCell {
    
    let imgV : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imgV)
        contentView.backgroundColor = UIColor(hex6: 0x0c1f3f)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //let insetBounds = UIEdgeInsetsInsetRect(bounds, CommonInsets)
        
        imgV.snp.makeConstraints { (make) in
            make.top.equalTo(8)
            make.left.equalTo(15)
            make.bottom.equalTo(-8)
            make.width.equalTo(60)
        }
    }
}
