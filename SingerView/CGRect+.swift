//
//  CGRect+.swift
//  SingerView
//
//  Created by 高炼 on 16/9/18.
//  Copyright © 2016年 mangonob. All rights reserved.
//

import UIKit

enum DWRectAnchorPosition {
    case Left, Right, Top, Bottom, LeftTop, RightTop, LeftBottom, RightBottom, Center
}

extension CGRect {
    var left: CGFloat {
        get {
            return origin.x
        }
        set {
            origin.x = newValue
        }
    }
    
    var right: CGFloat {
        get {
            return origin.x + size.width
        }
        set {
            origin.x = newValue - size.width
        }
    }
    
    var top: CGFloat {
        get {
            return origin.y
        }
        set {
            origin.y = newValue
        }
    }
    
    var bottom: CGFloat {
        get {
            return origin.y + size.height
        }
        set {
            origin.y = newValue - size.height
        }
    }
    
    var center: CGPoint {
        get {
            return CGPoint(x: CGRectGetMidX(self), y: CGRectGetMidY(self))
        }
        set {
            self = CGRectOffset(self, newValue.x - center.x, newValue.y - center.y)
        }
    }
    
    mutating func top(delta: CGFloat) {
        top = top + delta
    }
    
    mutating func bottom(delta: CGFloat) {
        bottom = bottom + delta
    }
    
    mutating func left(delta: CGFloat) {
        left = left + delta
    }
    
    mutating func right(delta: CGFloat) {
        right = right + delta
    }
    
    func getAnchor(position: DWRectAnchorPosition) {
    }
    
    func setAnchor(position: DWRectAnchorPosition, toPoint: CGPoint) {
    }
    
    func setAnchor(position: DWRectAnchorPosition, forward: CGPoint) {
    }
}


