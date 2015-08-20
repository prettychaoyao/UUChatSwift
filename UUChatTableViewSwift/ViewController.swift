//
//  ViewController.swift
//  UUChatTableViewSwift
//
//  Created by XcodeYang on 8/13/15.
//  Copyright © 2015 XcodeYang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var inputBackView: UIView!
    
    @IBOutlet weak var inputViewBottomContraint: NSLayoutConstraint!
    
    var dataArray: NSMutableArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataArray = NSMutableArray(array: [])
        
        for var i=0; i<20; i++ {
            self.dataArray.addObject(random()%60+5)
        }
        
        chatTableView.estimatedRowHeight = 50;
    }
    
    override func viewWillAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "batteryLevelChanged:", name: UIKeyboardWillChangeFrameNotification, object: nil)
    }
    
    override func viewDidDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        self.chatTableView.reloadData()
    }
    
    // private method
    
    @objc func batteryLevelChanged(notification: NSNotification) {
        
        let dict = NSDictionary(dictionary: notification.userInfo!)
        let keyboardValue = dict.objectForKey(UIKeyboardFrameEndUserInfoKey) as! NSValue
        let bootomDistance = UIScreen.mainScreen().bounds.size.height - keyboardValue.CGRectValue().origin.y
        let duration = Double(dict.objectForKey(UIKeyboardAnimationDurationUserInfoKey) as! NSNumber);
        
        UIView.animateWithDuration(duration, animations: {
            self.inputViewBottomContraint.constant = bootomDistance
            self.view.layoutIfNeeded()
            }, completion: {
                (value: Bool) in
                let indexPath = NSIndexPath(forRow: self.dataArray.count-1, inSection: 0)
                self.chatTableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true);
        })
    }

    
    
    // tableview delegate & dataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let num: NSInteger! = self.dataArray.objectAtIndex(indexPath.row) as! NSInteger
        if num > 50{
            let cell:UUChatRightMessageCell = tableView.dequeueReusableCellWithIdentifier("UUChatRightMessageCell") as! UUChatRightMessageCell
            cell.configUIWithModel(num);
            return cell;
        }
        else {
            let cell:UUChatLeftMessageCell = tableView.dequeueReusableCellWithIdentifier("UUChatLeftMessageCell") as! UUChatLeftMessageCell
            cell.configUIWithModel(num);
            return cell;
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.view.endEditing(true)
    }
}

