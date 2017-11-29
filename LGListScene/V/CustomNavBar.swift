//
//  CustomNavBar.swift
//  LGListScene
//
//  Created by Apple on 2017/11/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit
import SnapKit
class CustomNavBar: UINavigationBar {

    let titlelabel : UILabel = {
        let label1 = UILabel()
        label1.backgroundColor = UIColor.clear
        label1.text = "城市飘着雪"
        label1.font = AppFont()
        label1.textAlignment = .center
        label1.textColor = UIColor.white
        return label1
    }()
    
    let statusIndicator: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.strokeColor = UIColor.white.cgColor
        layer.lineWidth = 1
        layer.fillColor = UIColor.black.cgColor
        let size: CGFloat = 8
        let frame = CGRect(x: 0, y: 0, width: size, height: size)
        layer.path = UIBezierPath(roundedRect: frame, cornerRadius: size/2).cgPath
        layer.frame = frame
        return layer
    }()
    
    let highlightLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor(hex6: 0x76879D).cgColor
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.addSublayer(highlightLayer)
        layer.addSublayer(statusIndicator)
        addSubview(titlelabel)
        barTintColor = UIColor.black
        updateStatus()
    }
    
    private var statusOn = false
    func updateStatus() {
        statusOn = !statusOn
        CATransaction.begin()
        CATransaction.setValue(kCFBooleanTrue, forKey: kCATransactionDisableActions)
        statusIndicator.fillColor = (statusOn ? UIColor.white : UIColor.black).cgColor
        CATransaction.commit()
        unowned let weakSelf = self
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6) {
            weakSelf.updateStatus()
        }
    }
    
    private let titleWidth: CGFloat = 130
    private let borderHeight: CGFloat = 4
    func createNavBarBG() {
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: titleWidth, y: 0))
        path.addLine(to: CGPoint(x: titleWidth, y: bounds.height - borderHeight))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height - borderHeight))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height))
        path.addLine(to: CGPoint(x: 0, y: bounds.height))
        path.close()
        highlightLayer.path = path.cgPath
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        createNavBarBG()
        titlelabel.snp.makeConstraints { (make) in
            make.top.left.bottom.equalTo(0)
            make.width.equalTo(titleWidth)
        }
        statusIndicator.position = CGPoint.init(x: bounds.width-20, y: bounds.midY)
    }
}
