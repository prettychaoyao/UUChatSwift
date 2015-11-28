//
//  UUViewsCategory.swift
//  UUChatTableViewSwift
//
//  Created by 杨志平 on 11/24/15.
//  Copyright © 2015 XcodeYang. All rights reserved.
//

import UIKit


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

extension UITableView {
    
    func scrollToLastIndexOfCell(animation animation:Bool) {
        if (self.numberOfSections >= 1) {
            let numberOfRows = self.numberOfRowsInSection(self.numberOfSections-1)
            let indexPath = NSIndexPath.init(forRow: numberOfRows-1, inSection: self.numberOfSections-1)
            self.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Bottom, animated: animation)
        }
    }
}

