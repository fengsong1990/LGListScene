//
//  WeatherSummaryCell.swift
//  LGListScene
//
//  Created by Apple on 2017/11/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class WeatherSummaryCell: UICollectionViewCell {
   
    private let expandLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.font = AppFont(size: 20)
        label.textColor = UIColor(hex6: 0x44758b)
        label.textAlignment = .center
        label.text = ">>"
        label.sizeToFit()
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 0
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 4
        let subtitleAttributes = [
            NSAttributedStringKey.font: AppFont(size: 14),
            NSAttributedStringKey.foregroundColor: UIColor(hex6: 0x42c84b),
            NSAttributedStringKey.paragraphStyle: paragraphStyle
        ]
        let titleAttributes = [
            NSAttributedStringKey.font: AppFont(size: 24),
            NSAttributedStringKey.foregroundColor: UIColor.white
        ]
        let attributedText = NSMutableAttributedString(string: "LATEST\n", attributes: subtitleAttributes)
        attributedText.append(NSAttributedString(string: "WEATHER", attributes: titleAttributes))
        label.attributedText = attributedText
        label.sizeToFit()
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(expandLabel)
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = UIColor(hex6: 0x0c1f3f)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setExpanded(_ expanded: Bool) {
        self.expandLabel.transform = expanded ? CGAffineTransform(rotationAngle: CGFloat.pi / 2) : CGAffineTransform.identity
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let insets = CommonInsets
        titleLabel.frame = CGRect(x: insets.left, y: 0, width: titleLabel.bounds.width, height: bounds.height)
        expandLabel.center = CGPoint(x: bounds.width - expandLabel.bounds.width/2 - insets.right, y: bounds.height/2)
    }
}
