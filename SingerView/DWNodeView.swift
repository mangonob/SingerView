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
        frameManager = DWNodeFrameManager(node: self)
    }
    
    private var lineLayer: CAShapeLayer?
    
    lazy var associatePathView = DWPathView()
    
    var color: UIColor = UIColor.blackColor()
    
    var style: DWNodeStyle = .Line {
        didSet {
        }
    }
    
    var image: UIImage? {
        didSet {
            setNeedsDisplay()
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
    
    //MARK: - UIView
    override func drawRect(rect: CGRect) {
        print(bounds)
    }
    
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















