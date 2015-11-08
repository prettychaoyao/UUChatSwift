//
//  UUInputView.swift
//  UUChatTableViewSwift
//
//  Created by XcodeYang on 8/13/15.
//  Copyright © 2015 XcodeYang. All rights reserved.
//

import UIKit

class UUInputView: UIView, UITextViewDelegate{

    var leftButton: UIButton!
    var rightButton: UIButton!
    var contentTextView: UITextView!
    var placeHolderLabel: UILabel!
//    var contentViewHeight: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        leftButton = UIButton()
        self.addSubview(leftButton)
        leftButton.setImage(UIImage(named: "chat_voice_record"), forState: .Normal)
        leftButton.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(self).offset(8)
            make.bottom.equalTo(self).offset(-8)
            make.width.height.equalTo(30)
        }

        rightButton = UIButton()
        self.addSubview(rightButton)
        rightButton.setImage(UIImage(named: "chat_voice_record"), forState: .Normal)
        rightButton.snp_makeConstraints { (make) -> Void in
            make.trailing.bottom.equalTo(self).offset(-8)
            make.height.width.equalTo(30)
        }
        
        contentTextView = UITextView()
        self.addSubview(contentTextView)
        contentTextView.layer.cornerRadius = 4
        contentTextView.layer.borderWidth = 0.5
        contentTextView.layer.borderColor = UIColor.lightGrayColor().CGColor
        contentTextView.delegate = self
        contentTextView.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(self).offset(45)
            make.trailing.equalTo(self).offset(-45)
            make.top.equalTo(self).offset(8)
            make.bottom.equalTo(self).offset(-8)
            make.height.equalTo(30)
//            self.contentViewHeight = make.height.equalTo(30).constraint
        }
        
        placeHolderLabel = UILabel()
        placeHolderLabel.text = "请在这里输入文本内容"
        placeHolderLabel.textColor = UIColor.lightGrayColor()
        placeHolderLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        contentTextView.addSubview(placeHolderLabel)
        placeHolderLabel.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(contentTextView)
        }
}
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func textViewDidBeginEditing(textView: UITextView) {
        placeHolderLabel.hidden = true
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        placeHolderLabel.hidden = !textView.text.isEmpty
    }
    
    func textViewDidChange(textView: UITextView) {
        
//        contentViewHeight.constant = textView.contentSize.height
    }
    
    @IBAction func sendImage(btn:UIButton) {
        self.contentTextView.resignFirstResponder()
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        let libraryAction = UIAlertAction(title: "本地相册", style: UIAlertActionStyle.Default) { (action:UIAlertAction) -> Void in
            
        }
        let takePhotoAction = UIAlertAction(title: "拍照", style: UIAlertActionStyle.Default) { (action:UIAlertAction) -> Void in
            
        }
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        alert.addAction(cancelAction)
        alert.addAction(libraryAction)
        alert.addAction(takePhotoAction)
        
    }
    
    
    
}
