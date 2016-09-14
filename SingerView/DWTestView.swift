//
//  DWTestView.swift
//  SingerView
//
//  Created by 高炼 on 16/9/14.
//  Copyright © 2016年 mangonob. All rights reserved.
//

import UIKit

class DWTestView: UIView {
    override func drawRect(rect: CGRect) {
        NSString(string: "djflakskjdf").drawInRect(CGRect(x: 0, y: 0, width: 100000, height: 100), withAttributes: [
            NSFontAttributeName: UIFont.systemFontOfSize(100),
            NSForegroundColorAttributeName: UIColor.redColor(),
            ])
    }
}
