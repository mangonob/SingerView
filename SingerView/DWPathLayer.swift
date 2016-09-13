//
//  DWPathLayer.swift
//  SingerView
//
//  Created by 高炼 on 16/9/13.
//  Copyright © 2016年 mangonob. All rights reserved.
//

import UIKit

class DWPathLayer: CAShapeLayer {
    var startPoint: CGPoint = CGPointZero {
        didSet {
            CATransaction.begin()
            CATransaction.setDisableActions(!DWPathView.canAnimation)
            update()
            CATransaction.commit()
        }
    }
    var endPoint: CGPoint = CGPointZero {
        didSet {
            CATransaction.begin()
            CATransaction.setDisableActions(!DWPathView.canAnimation)
            update()
            CATransaction.commit()
        }
    }
    
    override func actionForKey(event: String) -> CAAction? {
        if event == "path" {
            let ani = CABasicAnimation(keyPath: "path")
            return ani
        }
        return nil
    }
    
    private func update() {
        let path = UIBezierPath()
        let A = startPoint
        let B = endPoint
        
        var handle = (B.x - A.x) * 0.3333
        if fabs(handle) < 10.0 {
            handle = handle <= 0 ? -10.0: 10.0
        }
        
        let C = CGPoint(x: A.x + handle, y: A.y)
        let D = CGPoint(x: B.x - handle, y: B.y)
        
        path.moveToPoint(A)
        path.addCurveToPoint(B, controlPoint1: C, controlPoint2: D)
        
        self.path = path.CGPath
    }
}
