//
//  UUInputView.swift
//  UUChatTableViewSwift
//
//  Created by XcodeYang on 8/13/15.
//  Copyright © 2015 XcodeYang. All rights reserved.
//

import UIKit

class UUInputView: UIView {

    var leftButton: UIButton!
    var rightButton: UIButton!
    var contentTextView: UITextView!
    
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
            make.width.height.equalTo(30)
        }
        
        contentTextView = UITextView()
        self.addSubview(contentTextView)
        contentTextView.layer.cornerRadius = 4
        contentTextView.layer.borderWidth = 0.5
        contentTextView.layer.borderColor = UIColor.lightGrayColor().CGColor
        contentTextView.backgroundColor = UIColor.yellowColor()
        contentTextView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(rightButton.snp_right).offset(8)
            make.right.equalTo(leftButton.snp_left).offset(-8)
            make.top.equalTo(self).offset(8)
            make.bottom.equalTo(self).offset(-8)
        }
}
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.blackColor().colorWithAlphaComponent(0.1).CGColor
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
