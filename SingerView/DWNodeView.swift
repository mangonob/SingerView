//
//  DWNodeView.swift
//  SingerView
//
//  Created by 高炼 on 16/9/9.
//  Copyright © 2016年 mangonob. All rights reserved.
//

import UIKit

public enum DWNodeDirection {
    case Left, Right, None
}

public enum DWNodeStyle {
    case Line, Rectangle, RoundRectangle, VeryRoundRectangle
}

public enum DWNodeStatus {
    case Normal, HightLight, Editing
}

class DWNodeView: UIView {
    private var lineLayer: CAShapeLayer?
    
    lazy var associatePathView = DWPathView()
    
    var color: UIColor = UIColor.blackColor()
    
    var style: DWNodeStyle = .Line {
        didSet {
        }
    }
    
    override var frame: CGRect {
        didSet {
            associatePathView.endPoint = center
        }
    }
    
    var direction: DWNodeDirection = .None {
        didSet {
            guard direction != .None else { return }
            childs?.forEach({ (node) in
                node.direction = direction
            })
        }
    }
    
    var parent: DWNodeView?
    var childs: [DWNodeView]?
    
    var frameManager: DWNodeFrameManager!
    
    private func clearToInitialView() {
        layer.borderColor = UIColor.clearColor().CGColor
        layer.borderWidth = 0
        layer.cornerRadius = 0
    }
    
    func refresh() {
    }
    
    //MARK: - About Modify
    func insert(index: UInt) {
    }
    
    func remove() {
        associatePathView.removeFromSuperview()
    }
    
    func swap() {
    }
    
    func append() {
    }
    
}





enum DWRectAnchorPosition {
    case Left, Right, Top, Bottom, LeftTop, RightTop, LeftBottom, RightBottom
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
}












