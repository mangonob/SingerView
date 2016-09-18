//
//  DWNodeFrameManager.swift
//  SingerView
//
//  Created by 高炼 on 16/9/13.
//  Copyright © 2016年 mangonob. All rights reserved.
//

import UIKit

private let NODE_FRAME_MARGIN = 8


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
    
    var depth: Int {
        guard let parent = parent else { return 0 }
        return parent.frameManager.depth + 1
    }
    
    var font = UIFont.systemFontOfSize(24)
    var textContainerInset = UITextView().textContainerInset
    
    var imageFrame: CGRect? {
        let contentRect = CGRectInset(node.bounds, 8, 8)
        
        return nil
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
