//
//  TakePhotoCenter.swift
//  UUChatTableViewSwift
//
//  Created by XcodeYang on 8/21/15.
//  Copyright © 2015 XcodeYang. All rights reserved.
//

import UIKit

class TakePhotoCenter: NSObject {
    
    var successBlock:((UIImage) -> Void)?
    
    func takePhoto (vc:UIViewController!, handler: ((img:UIImage) -> Void)?) {
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let libraryAction = UIAlertAction(title: "本地相册", style: .Default) { (action:UIAlertAction) -> Void in
            
        }
        let takePhotoAction = UIAlertAction(title: "拍照", style: .Default) { (action:UIAlertAction) -> Void in
            
        }
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        alert.addAction(cancelAction)
        alert.addAction(libraryAction)
        alert.addAction(takePhotoAction)
        vc.presentViewController(alert, animated: true, completion: nil)
        
        self.successBlock = { (UIImage) -> Void in
            
        }
    }
}
