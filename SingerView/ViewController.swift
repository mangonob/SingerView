//
//  ViewController.swift
//  SingerView
//
//  Created by 高炼 on 16/8/16.
//  Copyright © 2016年 mangonob. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    @IBOutlet weak var red: UIView!
    @IBOutlet weak var red2: DWView!
    
    
    
    @IBOutlet var reds: [DWView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var flag = false
    @IBAction func action(sender: AnyObject) {
        DWPathView.animateWithDuration(0.3) {
            self.reds.forEach({ (node) in
//                node.center = CGPoint(x: 100, y: 100)
                node.frame.center = CGPoint(x: 100, y: 100)
                if !self.flag {
                    node.transform = CGAffineTransformMakeScale(0.01, 0.01)
                } else {
                     node.transform = CGAffineTransformIdentity
                }
            })
            
            self.flag = !self.flag
        }
    }
}

