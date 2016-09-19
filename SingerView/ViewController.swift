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
    
    @IBOutlet weak var red: DWView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var flag = false
    @IBAction func action(sender: AnyObject) {
        
        DWPathView.animateWithDuration(0.3) {
            self.red.frame.bottom(100)
        }
    }
    
    // ----- code up to here
    @IBOutlet weak var nodeview: DWNodeView!
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("\(arc4random() % 10)")
        red.frameManager?.image = UIImage(named: "test1")
        red.frameManager?.attributeText = {
            let a = UITextView()
            a.text = "mangonob"
            return a.attributedText
        }()
        
        red.frameManager?.updateNodeBound()
        
//        super.viewDidLayoutSubviews()
//        nodeview.frameManager?.attributeText = textView.attributedText
//        nodeview.frameManager?.image = UIImage(named: "test1")
//        nodeview.frameManager?.updateNodeBound()
    }
    
    @IBAction func asdfasdf(sender: AnyObject) {
        red.style = DWNodeStyle.Rectangle
    }
    
    @IBAction func asdfsaf(sender: AnyObject) {
        red.style = DWNodeStyle.Line
    }
    
    @IBAction func wet23asdf(sender: AnyObject) {
        red.style = DWNodeStyle.RoundRectangle
    }
    
    @IBAction func ef324ysdffasd(sender: AnyObject) {
        red.style = DWNodeStyle.VeryRoundRectangle
    }
}







