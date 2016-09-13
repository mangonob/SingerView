//
//  DWPathView.swift
//  SingerView
//
//  Created by 高炼 on 16/9/12.
//  Copyright © 2016年 mangonob. All rights reserved.
//

import UIKit

@IBDesignable class DWPathView: UIView {
    internal static var canAnimation = false
    
    @IBInspectable var startPoint: CGPoint = CGPointZero {
        didSet {
            update()
            shapeLayer.startPoint = startPoint
        }
    }
    @IBInspectable var endPoint: CGPoint = CGPointZero {
        didSet {
            update()
            shapeLayer.endPoint = endPoint
        }
    }
    @IBInspectable var strokeColor: UIColor = UIColor.greenColor() { didSet { update() } }
    @IBInspectable var dashWidth: CGFloat = 0 { didSet { update() } }
    @IBInspectable var dashPhase: CGFloat = 0 { didSet { update() } }
    @IBInspectable var lineWidth: CGFloat = 6 { didSet { update() } }
    
    lazy private var shapeLayer = DWPathLayer()
    
    //MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRectZero)
        configure()
    }
    
    init() {
        super.init(frame: CGRectZero)
        configure()
    }
    
    //MARK: - UIView
    override func layoutSubviews() {
        super.layoutSubviews()
        update()
    }
    
    //MARK: - Configure
    func configure() {
        userInteractionEnabled = false
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.lineJoin = kCALineJoinRound
        layer.addSublayer(shapeLayer)
        update()
    }
    
    private func update() {
        shapeLayer.lineWidth = lineWidth
        shapeLayer.strokeColor = strokeColor.CGColor
        if dashPhase < 0.01 {
            shapeLayer.lineDashPattern = nil
        } else {
            shapeLayer.lineDashPattern = [dashWidth]
        }
        frame = CGRect(origin: CGPointZero, size: CGSize(width: fabs(endPoint.x - startPoint.x), height: fabs(endPoint.y - startPoint.y)))
    }
    
    //Mark: - Animation
    override class func animateWithDuration(duration: NSTimeInterval, animations: () -> Void) {
        let temp = DWPathView.canAnimation
        DWPathView.canAnimation = true
        CATransaction.begin()
        CATransaction.setAnimationDuration(duration)
        CATransaction.setAnimationTimingFunction(CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear))
        UIView.animateWithDuration(duration, animations: animations)
        CATransaction.commit()
        DWPathView.canAnimation = temp
    }
}
















