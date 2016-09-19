//
//  DWNodeFrameManager.swift
//  SingerView
//
//  Created by 高炼 on 16/9/13.
//  Copyright © 2016年 mangonob. All rights reserved.
//

import UIKit

private let MAX_HEIGHT_OF_IAMGE: CGFloat = 200
//private let DISTANCE_OF_TEXTEDITER_AND_IMAGE = 0

class DWNodeFrameManager: NSObject {
    let HAND_LENGTH = 100
    weak var node: DWNodeView!
    
    //MARK: - Init
    init(node: DWNodeView) {
        super.init()
        self.node = node
    }
    
    var parent: DWNodeView? { get { return node.parent } }
    var childs: [DWNodeView]? { get { return node.childs } }
    
    var NODE_FRAME_MARGIN: CGFloat {
        return node.style == .Line && node.depth != 0 ? 0 : 10
    }
    
    var textContainerInset = UITextView().textContainerInset
    
    var attributeText: NSAttributedString? { didSet { } }
    var image: UIImage? { didSet { } }
    
    internal func textSize() -> CGSize? {
        guard let attributeText = attributeText else { return nil }
        let textHeight = attributeText.boundingRectWithSize(CGSize(width: contentSize().width, height: CGFloat.max), options: [.UsesFontLeading, .UsesLineFragmentOrigin], context: nil).height
        return CGSize(width: contentSize().width + textContainerInset.left + textContainerInset.right, height: textHeight + textContainerInset.top + textContainerInset.bottom)
    }
    
    internal func contentSize() -> CGSize {
        return CGRectInset(node.bounds, NODE_FRAME_MARGIN, NODE_FRAME_MARGIN).size
    }
    
    private var textContainerFrame: CGRect? {
        guard let textSize = textSize() else { return nil }
        
        let origin = CGPoint(x: CGRectGetMinX(node.bounds) + NODE_FRAME_MARGIN, y: CGRectGetMaxY(node.bounds) - NODE_FRAME_MARGIN - textSize.height)
        
        return CGRect(origin: origin, size: textSize)
    }
    
    var textFrame: CGRect? {
        guard let textContainerFrame = textContainerFrame, textSize = textSize() else { return nil }
        let origin = CGPoint(x: textContainerFrame.origin.x + textContainerInset.left, y: textContainerFrame.origin.y + textContainerInset.top)
        print("text frame : \(CGRect(origin: origin, size: textSize))")
        return CGRect(origin: origin, size: textSize)
    }
    
    var imageFrame: CGRect? {
        guard let imgSize = image?.size else { return nil }
        var origin = CGPointZero
        if let textContainerFrame = textContainerFrame {
            origin = CGPoint(x: CGRectGetMinX(textContainerFrame), y: CGRectGetMinY(textContainerFrame) - MAX_HEIGHT_OF_IAMGE)
        } else {
            origin = CGPoint(x: CGRectGetMinX(node.bounds), y: CGRectGetMinY(node.bounds) - MAX_HEIGHT_OF_IAMGE)
        }
        
        let rect = CGRect(origin: origin, size: CGSize(width: contentSize().width, height: MAX_HEIGHT_OF_IAMGE))
        var imgRect = CGRectContain(rect, size: imgSize)
        print("image rect : \(imgRect)")
        
        let offset = (rect.height - imgRect.height) / 2
        imgRect.origin.y = imgRect.origin.y + offset
        
        return imgRect
    }
    
    func updateNodeBound() {
        var content: CGRect?
        if imageFrame == nil && textContainerFrame != nil {
            content = textContainerFrame!
        } else if imageFrame != nil && textContainerFrame == nil {
            content = imageFrame!
        } else if imageFrame != nil && textContainerFrame != nil {
            content = CGRectUnion(textContainerFrame!, imageFrame!)
        } else {
            content = nil
        }
        
        if let content = content {
            node.frame = CGRect(origin: node.frame.origin, size: CGRectInset(content, -NODE_FRAME_MARGIN, -NODE_FRAME_MARGIN).size)
        }
    }
    
    //    var leftTop: CGFloat {
    //        get {
    //
    //            guard let lastLeft = childs?.filter({ (nnn) -> Bool in
    //                return nnn.direction == .Left
    //            }).last else { return 0 }
    //
    //            return lastLeft.frame.origin.y
    //        }
    //    }
    
    //    var leftBottom: CGFloat {
    //        get {
    //            guard let firstLeft = childs?.filter({ (node) -> Bool in
    //                return node.direction == .Left
    //            }).first else { return 0 }
    //
    //            return firstLeft.frame.origin.y + firstLeft.frame.height
    //        }
    //    }
    //
    //    var rightBottom: CGFloat {
    //        get {
    //            guard let firstRight = childs?.filter({ (node) -> Bool in
    //                return node.direction == .Left
    //            }).first else { return 0 }
    //
    //            return firstRight.frame.origin.y + firstRight.frame.height
    //        }
    //    }
    
    var A: CGPoint {
        get {
            switch node.style {
            case .Line:
                return CGPoint(x: node.frame.origin.x, y: node.frame.origin.y + node.frame.height)
            default:
                return CGPoint(x: node.frame.origin.x, y: node.frame.origin.y + node.frame.height / 2)
            }
        }
    }
    
    var B: CGPoint {
        get {
            switch node.style {
            case .Line:
                return CGPoint(x: node.frame.origin.x + node.frame.width, y: node.frame.origin.y + node.frame.height)
            default:
                return CGPoint(x: node.frame.origin.x + node.frame.width, y: node.frame.origin.y + node.frame.height / 2)
            }
        }
    }
    
    var C: CGPoint {
        get {
            return CGPoint(x: node.frame.origin.x, y: node.frame.origin.y + node.frame.height / 2)
        }
    }
    
    var D: CGPoint {
        get {
            return CGPoint(x: node.frame.origin.x + node.frame.width, y: node.frame.origin.y + node.frame.height / 2)
        }
    }
}

func CGRectContain(rect: CGRect, size: CGSize) -> CGRect {
    let ra = CGRect(origin: CGPointZero, size: CGSize(width: rect.width, height: rect.width * size.height / size.width))
    let rb = CGRect(origin: CGPointZero, size: CGSize(width: rect.height * size.width / size.height, height: rect.height))
    var inner = ra.height * ra.width > rb.height * rb.width ? rb : ra
    inner.center = rect.center
    return inner
}

func CGRectByTwoPoint(point1: CGPoint, point2: CGPoint) -> CGRect {
    let rect = CGRect(origin: point1, size: CGSize(width: point2.x - point1.x, height: point2.y - point1.y))
    return CGRectStandardize(rect)
}












