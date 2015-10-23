//
//  UUInputView.swift
//  UUChatTableViewSwift
//
//  Created by XcodeYang on 8/13/15.
//  Copyright © 2015 XcodeYang. All rights reserved.
//

import UIKit

class UUInputView: UIView {

    @IBOutlet weak var leftButton: UIButton!
    
    @IBOutlet weak var rightButton: UIButton!
    
    @IBOutlet weak var contentTextField: UITextField!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.blackColor().colorWithAlphaComponent(0.1).CGColor
    }
    
    @IBAction func sendImage(btn:UIButton) {
        self.contentTextField.resignFirstResponder()
        
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
