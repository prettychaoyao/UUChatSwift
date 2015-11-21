//
//  UUInputView.swift
//  UUChatTableViewSwift
//
//  Created by XcodeYang on 8/13/15.
//  Copyright © 2015 XcodeYang. All rights reserved.
//

import UIKit

class UUInputView: UIView, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    var leftButton: UIButton!
    var rightButton: UIButton!
    var contentTextView: UITextView!
    var placeHolderLabel: UILabel!
    var contentViewHeightConstraint: NSLayoutConstraint!
    
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
        rightButton.setImage(UIImage(named: "chat_take_picture"), forState: .Normal)
        rightButton.addTarget(self, action: Selector("sendImage"), forControlEvents: .TouchUpInside)
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
            make.height.greaterThanOrEqualTo(30)
        }
        contentViewHeightConstraint = NSLayoutConstraint(
            item: contentTextView,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: 30
        )
        contentViewHeightConstraint.priority = UILayoutPriorityDefaultHigh
        self.addConstraint(contentViewHeightConstraint)
        
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
    
    // adjust content's height from 30 t0 100
    func textViewDidChange(textView: UITextView) {
        let textContentH = textView.contentSize.height
        let textHeight = textContentH>30 ? (textContentH<100 ? textContentH:100):30
        contentViewHeightConstraint.constant = textHeight
    }
    
    func sendImage() {
        self.contentTextView.resignFirstResponder()
        
        let sheet = UIAlertController()
        // is the device support camera?（iPod & Simulator）
        if (UIImagePickerController.isSourceTypeAvailable(.Camera)) {
            sheet.addAction(UIAlertAction.init(title: "Camera", style: .Default, handler: { _ in
                self.showPhotoes(.Camera)
            }))
        }
        sheet.addAction(UIAlertAction.init(title: "PhotoLibrary", style: .Default, handler: { _ in
            self.showPhotoes(.PhotoLibrary)
        }))
        sheet.addAction(UIAlertAction.init(title: "SavedPhotosAlbum", style: .Default, handler: { _ in
            self.showPhotoes(.SavedPhotosAlbum)
        }))
        sheet.addAction(UIAlertAction.init(title: "Cancel", style: .Cancel, handler: nil))
        
        
        if let resppp:UIViewController? = self.responderViewController() {
            resppp!.presentViewController(sheet, animated: true, completion: nil)
        }
    }
    
    func showPhotoes(source: UIImagePickerControllerSourceType) {
        if let resppp:UIViewController? = self.responderViewController() {
            let controller = UIImagePickerController()
            controller.delegate = self
            controller.sourceType = source
            controller.allowsEditing = source == .SavedPhotosAlbum ? true:false
            resppp!.presentViewController(controller, animated: true, completion: nil)
        }
    }
}

// find VC
extension UIView {
    
    func responderViewController() -> UIViewController {
        var responder: UIResponder! = nil
        for var next = self.superview; (next != nil); next = next!.superview {
            responder = next?.nextResponder()
            if (responder!.isKindOfClass(UIViewController)){
                return (responder as! UIViewController)
            }
        }
        return (responder as! UIViewController)
    }
}
