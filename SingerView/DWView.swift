//
//  DWView.swift
//  SingerView
//
//  Created by 高炼 on 16/9/13.
//  Copyright © 2016年 mangonob. All rights reserved.
//

import UIKit

class DWView: DWNodeView {
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
    
    //MARK: - Configure
    func configure() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(gestureAction(_:)))
        addGestureRecognizer(pan)
    }
    
    
    func gestureAction(sender: UIPanGestureRecognizer) {
        let t = sender.translationInView(self)
        frame.bottom(t.y)
        frame.right(t.x)
        sender.setTranslation(CGPointZero, inView: self)
    }
    
    override func didMoveToSuperview() {
        let map = [
            UIColor.dwWaterBlueColor(),
            UIColor.dwSaffronColor(),
            UIColor.dwTealishColor(),
            UIColor.dwLipstickColor(),
            UIColor.dwWarmPurpleColor(),
            UIColor.dwMediumGreenColor(),
        ]
        
        super.didMoveToSuperview()
        superview?.addSubview(associatePathView)
        superview?.insertSubview(associatePathView, belowSubview: self)
        associatePathView.backgroundColor = UIColor.blueColor().colorWithAlphaComponent(0.2)
        associatePathView.strokeColor = map[Int(arc4random()) % map.count]
        
        associatePathView.startPoint = CGPoint(x: 100, y: 100)
        associatePathView.endPoint = center
    }
}

















