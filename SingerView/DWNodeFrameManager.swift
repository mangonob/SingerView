//
//  DWNodeFrameManager.swift
//  SingerView
//
//  Created by 高炼 on 16/9/13.
//  Copyright © 2016年 mangonob. All rights reserved.
//

import UIKit

private let MAX_HEIGHT_OF_IAMGE: CGFloat = 200

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
        return node.style == .Line ? 0 : 10
    }
    
    var depth: Int {
        guard let parent = parent else { return 0 }
        return parent.frameManager.depth + 1
    }
    
    var textContainerInset = UITextView().textContainerInset
    var attributeText: NSAttributedString?
    var textWidth = CGFloat.max
    var image: UIImage?
    
    var textFrame: CGRect? {
        if attributeText == nil || attributeText == "" {
            return nil
        }
        return nil
    }
    
    var imageFrame: CGRect? {
        guard let image = image else { return nil }
        guard let textFrame = textFrame else { return CGRectInset(node.bounds, NODE_FRAME_MARGIN, NODE_FRAME_MARGIN) }
        return nil
    }
    
    func openText() {
    }
    
    func initFrameByTextView(textView: UITextView?) {
        guard let textView = textView else { return }
        textView.text = ""
        node.frame = CGRect(origin: CGPointZero, size: CGRectInset(textView.bounds, NODE_FRAME_MARGIN, NODE_FRAME_MARGIN).size)
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
    
    
    var anchorA: CGPoint {
        get {
            return CGPointZero
        }
    }
    
    var anchorB: CGPoint {
        get {
            return CGPointZero
        }
    }
    
    var anchorC: CGPoint {
        get {
            return CGPointZero
        }
    }
}
