//
//  DWViewController.swift
//  SingerView
//
//  Created by 高炼 on 16/9/18.
//  Copyright © 2016年 mangonob. All rights reserved.
//

import UIKit

class DWViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var mview: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var redview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
    }
    @IBAction func longPressGesture(sender: UILongPressGestureRecognizer) {
        print(redview.transform)
    }
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return container
    }
}
