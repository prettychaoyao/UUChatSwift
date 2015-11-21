//
//  RootViewController.swift
//  UUChatTableViewSwift
//
//  Created by 杨志平 on 11/8/15.
//  Copyright © 2015 XcodeYang. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let showBtn = UIButton(type: .Custom)
        showBtn.setTitle("Creat Chat Room", forState: .Normal)
        showBtn.setTitleColor(UIColor.purpleColor(), forState: .Normal)
        showBtn.addTarget(self, action: Selector("showChatRoom"), forControlEvents: .TouchUpInside)
        showBtn.center = view.center
        view.addSubview(showBtn)
        
        showBtn.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(view)
        }
        showBtn.contentEdgeInsets = UIEdgeInsetsMake(8, 20, 8, 20)
        showBtn.layer.borderColor = UIColor.purpleColor().CGColor
        showBtn.layer.borderWidth = 1
        showBtn.layer.cornerRadius = 10
    }

    internal func showChatRoom() {
        let nvc = UINavigationController.init(rootViewController: ChatTableViewController())
        self.presentViewController(nvc, animated: true, completion: nil)
    }
}
