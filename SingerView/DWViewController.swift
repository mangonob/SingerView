//
//  DWViewController.swift
//  SingerView
//
//  Created by 高炼 on 16/9/14.
//  Copyright © 2016年 mangonob. All rights reserved.
//

import UIKit

class DWViewController: UIViewController, UITextViewDelegate {
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
    }
    
    func textViewShouldEndEditing(textView: UITextView) -> Bool {
        return true
    }
    
    func textViewDidChange(textView: UITextView) {
        textView.frame = textView.attributedText.boundingRectWithSize(CGSize(width: 200, height: CGFloat(Float.infinity)), options: [
            .UsesLineFragmentOrigin, .UsesFontLeading
            ], context: nil)
    }
}
