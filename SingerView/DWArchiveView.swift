//
//  DWArchiveView.swift
//  SingerView
//
//  Created by 高炼 on 16/9/19.
//  Copyright © 2016年 mangonob. All rights reserved.
//

import UIKit

class DWArchiveView: UIView {
    var subs: [DWArchiveView]?
    var n = ""
    
    //MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        subs = aDecoder.decodeObjectForKey("subs") as? [DWArchiveView]
        
        if let s = aDecoder.decodeObjectForKey("n") as? String {
            n = s
        }
        
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
    
    //MARK: - Encoder
    override func encodeWithCoder(aCoder: NSCoder) {
        super.encodeWithCoder(aCoder)
        aCoder.encodeObject(subs, forKey: "subs")
        aCoder.encodeObject(n, forKey: "n")
    }
    
    //MARK: - Configure
    func configure() {
    }
}
