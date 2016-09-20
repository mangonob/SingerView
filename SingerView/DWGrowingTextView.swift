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
    
    var placeholder = "" {
        didSet {
            placeholderView.text = placeholder
        }
    }
    
    var growingDirection = DWGrowingTextViewGrowingDirection.Down
    var placeholderColor = UIColor.lightGrayColor()
    
    var minWidth: CGFloat = 30 { didSet { textChanged(nil) } }
    var maxWidth: CGFloat = 200 { didSet { textChanged(nil) } }
    
    var maxLine = Int.max
    
    lazy var placeholderView = UITextView()
    
    override var font: UIFont? {
        didSet {
            placeholderView.font = font
        }
    }
    
    //MARK: - UIView
    override func layoutSubviews() {
        super.layoutSubviews()
        textChanged(nil)
    }
    
    // MARK: - Action 
    func textChanged(notification: NSNotification?) {
        placeholderView.hidden = !(NSString(string: text).length == 0)
        
        let length = ceil(attributedText.boundingRectWithSize(CGSize(width: CGFloat.max, height: CGFloat.max), options: [.UsesFontLeading, .UsesLineFragmentOrigin], context: nil).width)
        var width = length + textContainerInset.left + textContainerInset.right
        
        if width < minWidth {
            width = minWidth
        } else if width > maxWidth {
            width = maxWidth
        }
        
        let height = ceil(sizeThatFits(CGSize(width: width, height: CGFloat.max)).height)
        let maxHeight = font!.lineHeight * CGFloat(maxLine) + textContainerInset.top + textContainerInset.bottom
        
        scrollEnabled = height > maxHeight
        showsVerticalScrollIndicator = scrollEnabled
        
        var oldFrame = frame
        if growingDirection == .Up {
            oldFrame = CGRectOffset(oldFrame, 0, oldFrame.height - min(maxHeight, height))
        }
        oldFrame.size.height = min(maxHeight, height)
        oldFrame.size.width = width
        frame = oldFrame
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
        
        
        // disable Autolayout
        translatesAutoresizingMaskIntoConstraints = true
        
        
        // Fix the padding
        var inset = textContainerInset
        inset.left = textContainer.lineFragmentPadding
        inset.right = textContainer.lineFragmentPadding
        textContainerInset = inset
        textContainer.lineFragmentPadding = 0
        // Fix End
        
        textAlignment = .Center
        
        subviews.filter { (view) -> Bool in
            return !(view is UITextView)
        }.first?.layoutMargins = UIEdgeInsetsZero
        
        print(subviews.filter { (view) -> Bool in
            return !(view is UITextView)
        }.first?.layoutMargins)
        
        layer.cornerRadius = 0
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGrayColor().CGColor
        
        scrollEnabled = false
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(textChanged(_:)), name: UITextViewTextDidChangeNotification, object: self)
        
        // Active the notification
        text = ""
        textChanged(nil)
    }
}





















