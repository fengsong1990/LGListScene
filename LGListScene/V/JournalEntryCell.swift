//
//  JournalEntryCell.swift
//  LGListScene
//
//  Created by Apple on 2017/11/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit
import SnapKit
class JournalEntryCell: UICollectionViewCell {
    
    static let font = AppFont()
    static let titleHeight: CGFloat = 20
    static let inset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    
    static func cellSize(width: CGFloat, text: String) -> CGSize {
        let labelBounds = TextSize.size(text, font: JournalEntryCell.font, width: width, insets: JournalEntryCell.inset).size
        return CGSize(width: width, height: labelBounds.height + JournalEntryCell.titleHeight + 16)
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor(hex6: 0x42c84b)
        return label
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.font = AppFont(size: 14)
        label.numberOfLines = 0
        label.font = JournalEntryCell.font
        label.textColor = UIColor.white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(hex6: 0x0c1f3f)
        contentView.addSubview(label)
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //label.frame = UIEdgeInsetsInsetRect(bounds, JournalEntryCell.inset)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.top.equalTo(8)
            make.height.equalTo(JournalEntryCell.titleHeight)
        }
        label.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(0)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottom.equalTo(-8)
        }
    }
}
