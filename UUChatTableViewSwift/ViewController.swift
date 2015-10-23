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
        
        chatTableView.registerClass(UUChatLeftMessageCell.classForKeyedArchiver(), forCellReuseIdentifier: "UUChatLeftMessageCell")
        chatTableView.registerNib(UINib(nibName: "UUChatRightMessageCell", bundle: nil), forCellReuseIdentifier: "UUChatRightMessageCell")
        chatTableView.estimatedRowHeight = 100
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "batteryLevelChanged:", name: UIKeyboardWillChangeFrameNotification, object: nil)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidAppear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        self.chatTableView.reloadData()
    }
    
    
    
    // private method
    
    @objc func batteryLevelChanged(notification: NSNotification) {
        
        let dict = NSDictionary(dictionary: notification.userInfo!)
        let keyboardValue = dict.objectForKey(UIKeyboardFrameEndUserInfoKey) as! NSValue
        let bottomDistance = UIScreen.mainScreen().bounds.size.height - keyboardValue.CGRectValue().origin.y
        let duration = Double(dict.objectForKey(UIKeyboardAnimationDurationUserInfoKey) as! NSNumber)
        
        UIView.animateWithDuration(duration, animations: {
            self.inputViewBottomContraint.constant = bottomDistance
            self.view.layoutIfNeeded()
            }, completion: {
                (value: Bool) in
                let indexPath = NSIndexPath(forRow: self.dataArray.count-1, inSection: 0)
                self.chatTableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
        })
    }
    
    
    
    // tableview delegate & dataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let num: NSInteger! = self.dataArray.objectAtIndex(indexPath.row) as! NSInteger
        if num%2 == 0 {
            let cell:UUChatRightMessageCell = tableView.dequeueReusableCellWithIdentifier("UUChatRightMessageCell") as! UUChatRightMessageCell
            cell.configUIWithModel(num)
            return cell
        }
        else {
            let cell:UUChatLeftMessageCell = tableView.dequeueReusableCellWithIdentifier("UUChatLeftMessageCell") as! UUChatLeftMessageCell
            cell.configUIWithModel(num)
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.view.endEditing(true)
    }
    
    
    // action
    
    @IBAction func sendImage(btn:UIButton) {
        self.view.endEditing(true)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let libraryAction = UIAlertAction(title: "本地相册", style: .Default) { (action:UIAlertAction) -> Void in
            
        }
        let takePhotoAction = UIAlertAction(title: "拍照", style: .Default) { (action:UIAlertAction) -> Void in
            
        }
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        alert.addAction(cancelAction)
        alert.addAction(libraryAction)
        alert.addAction(takePhotoAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
}


