//
//  DWGrowingTextView.swift
//  SingerView
//
//  Created by Trinity on 16/9/17.
//  Copyright © 2016年 mangonob. All rights reserved.
//

import UIKit
enum DWGrowingTextViewGrowingDirection {
    case Up, Down
}

class DWGrowingTextView: UITextView {
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UITextViewTextDidChangeNotification, object: self)
    }
    
    var placeholder = "Placeholder" {
        didSet {
            placeholderView.text = placeholder
        }
    }
    
    var growingDirection = DWGrowingTextViewGrowingDirection.Down
    var placeholderColor = UIColor.lightGrayColor()
    var maxLine = 5
    lazy var placeholderView = UITextView()
    
    override var font: UIFont? {
        didSet {
            placeholderView.font = font
        }
    }
    
    // MARK: - Action 
    func textChanged(notification: NSNotification?) {
        placeholderView.hidden = !(NSString(string: text).length == 0)
        
        let height = ceil(sizeThatFits(CGSize(width: frame.width, height: CGFloat.max)).height)
        let maxHeight = font!.lineHeight * CGFloat(maxLine) + textContainerInset.top + textContainerInset.bottom
        
        scrollEnabled = height > maxHeight
        showsVerticalScrollIndicator = scrollEnabled
        
        if !scrollEnabled {
            var oldFrame = frame
            if growingDirection == .Up {
                oldFrame = CGRectOffset(oldFrame, 0, oldFrame.height - min(maxHeight, height))
            }
            oldFrame.size.height = min(maxHeight, height)
            frame = oldFrame
        }
    }
    
    func loadComponent() {
        placeholderView.frame = bounds
        placeholderView.userInteractionEnabled = false
        placeholderView.backgroundColor = UIColor.clearColor()
        placeholderView.translatesAutoresizingMaskIntoConstraints = true
        placeholderView.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
        placeholderView.font = font
        placeholderView.textAlignment = .Center
        placeholderView.textColor = placeholderColor
        placeholderView.hidden = !(NSString(string: text).length == 0)
        addSubview(placeholderView)
        placeholderView.text = placeholder
    }
    
    // MARK: - Configure
    func configure() {
        loadComponent()
        layer.cornerRadius = 5
        layer.borderWidth = 1
        layer.borderColor = UIColor.grayColor().CGColor
        
        scrollEnabled = false
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(textChanged(_:)), name: UITextViewTextDidChangeNotification, object: self)
        
        // Active the notification
        text = ""
        textChanged(nil)
    }
}





















