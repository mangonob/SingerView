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
        translatesAutoresizingMaskIntoConstraints = true
        
        frameManager = DWNodeFrameManager(node: self)
        style = .Rectangle
        
        // About line layer to show node border
        layer.addSublayer(lineLayer)
        lineLayer.fillColor = UIColor.clearColor().CGColor
        lineLayer.strokeColor = color.CGColor
        lineLayer.lineWidth = 6
        lineLayer.lineCap = kCALineCapRound
        lineLayer.lineJoin = kCALineJoinRound
        // end line layer to show node border
    }
    
    var depth: Int {
        guard let parent = parent else { return 0 }
        return parent.depth + 1
    }
    
    private lazy var lineLayer = CAShapeLayer()
    
    private var _associatePathView: DWPathView?
    var associatePathView: DWPathView? {
        if depth == 0 {
            return nil
        } else {
            if _associatePathView == nil {
                _associatePathView = DWPathView()
            }
            return _associatePathView
        }
    }
    
    
    var color: UIColor = UIColor.blackColor() {
        didSet {
            lineLayer.strokeColor = color.CGColor
        }
    }
    
    var style: DWNodeStyle = .Line { didSet { updateLineLayer() } }
    
    override var frame: CGRect {
        didSet {
            if center.x > associatePathView?.startPoint.x {
                associatePathView?.endPoint = frameManager?.A ?? CGPointZero
            } else {
                associatePathView?.endPoint = frameManager?.B ?? CGPointZero
            }
            updateLineLayer()
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
    
    var frameManager: DWNodeFrameManager?
    
    //MARK: - UIView
    override func drawRect(rect: CGRect) {
        if let textFrame = frameManager?.textFrame, attributeText = frameManager?.attributeText {
            attributeText.drawInRect(textFrame)
        }
        if let imageFrame = frameManager?.imageFrame, image = frameManager?.image {
            image.drawInRect(imageFrame)
        }
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        updateLineLayer()
    }

    private func clearToInitialView() {
        layer.borderColor = UIColor.clearColor().CGColor
        layer.borderWidth = 0
        layer.cornerRadius = 0
    }
    
    func refresh() {
    }
    
    func updateLineLayer() {
        guard let frameManager = frameManager else { return }
        if depth == 0 {
            // Main Node
            self.color = UIColor.clearColor()
            // Main Node
        }
        
        let A = convertPoint(frameManager.A, fromView: superview)
        let B = convertPoint(frameManager.B, fromView: superview)
        
        var path = UIBezierPath()
        layer.masksToBounds = true
        backgroundColor = UIColor.whiteColor()
        
        switch style {
        case .Line:
            layer.masksToBounds = false
            if depth != 0 {
                backgroundColor = UIColor.clearColor()
            }
            path.moveToPoint(A)
            path.addLineToPoint(B)
            break
        case .Rectangle:
            path = UIBezierPath(rect: bounds)
            layer.cornerRadius = 0
            break
        case .RoundRectangle:
            let radius = min(max(5, max(bounds.height, bounds.width) * 0.15), 10)
            path = UIBezierPath(roundedRect: bounds, cornerRadius: radius)
            layer.cornerRadius = radius
            break
        case .VeryRoundRectangle:
            path = UIBezierPath(roundedRect: bounds, cornerRadius: min(bounds.height, bounds.width) / 2)
            layer.cornerRadius = min(bounds.height, bounds.width) / 2
            break
        }
        associatePathView?.endPoint = center.x > associatePathView?.startPoint.x ? frameManager.A : frameManager.B
        lineLayer.path = path.CGPath
    }
    //MARK: - About Modify
    func insert(index: UInt) {
    }
    
    func remove() {
        associatePathView?.removeFromSuperview()
    }
    
    func swap() {
    }
    
    func append() {
    }
    
}















