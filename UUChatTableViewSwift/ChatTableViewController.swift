//
//  ViewController.swift
//  UUChatTableViewSwift
//
//  Created by XcodeYang on 8/13/15.
//  Copyright © 2015 XcodeYang. All rights reserved.
//

import UIKit

private let leftCellId = "UUChatLeftMessageCell"
private let rightCellId = "UUChatRightMessageCell"

let MainScreenSize = UIScreen.mainScreen().bounds.size

class ChatTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var chatTableView: UITableView!
    var inputBackView: UUInputView!
    var dataArray: NSMutableArray!
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardFrameChanged:", name: UIKeyboardWillChangeFrameNotification, object: nil)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidAppear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        self.chatTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBaseViews()
        
        
        self.dataArray = NSMutableArray(array: [])
        
        for var i=0; i<20; i++ {
            self.dataArray.addObject(random()%60+5)
        }
        
        chatTableView.registerClass(UUChatLeftMessageCell.classForKeyedArchiver(), forCellReuseIdentifier: leftCellId)
        chatTableView.registerClass(UUChatRightMessageCell.classForKeyedArchiver(), forCellReuseIdentifier: rightCellId)
        chatTableView.estimatedRowHeight = 100
    }
    
    func initBaseViews() {
        
        self.title = "UUChat - Swift2"
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .Stop, target: self, action: Selector("backAction"))
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .Search, target: self, action: nil)
        
        inputBackView = UUInputView.init(frame: CGRectMake(0, MainScreenSize.height-45, MainScreenSize.width, 45))
        self.view.addSubview(inputBackView)
        inputBackView.snp_makeConstraints { (make) -> Void in
            make.leading.trailing.bottom.equalTo(self.view)
            make.height.equalTo(49)
        }
        
        chatTableView = UITableView.init(frame: CGRectZero, style: .Plain)
        chatTableView.dataSource = self
        chatTableView.delegate = self
        chatTableView.separatorStyle = UITableViewCellSeparatorStyle.None
        chatTableView.estimatedRowHeight = 60
        self.view.addSubview(chatTableView)
        chatTableView.snp_makeConstraints { (make) -> Void in
            make.top.leading.trailing.equalTo(self.view)
            make.bottom.equalTo(inputBackView.snp_top)
        }
        chatTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0)
    }
    
    // private method
    
    func backAction(){
        if navigationController?.viewControllers.count>1 {
            self.navigationController?.popViewControllerAnimated(true)
        } else {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @objc func keyboardFrameChanged(notification: NSNotification) {
        
        let dict = NSDictionary(dictionary: notification.userInfo!)
        let keyboardValue = dict.objectForKey(UIKeyboardFrameEndUserInfoKey) as! NSValue
        let bottomDistance = MainScreenSize.height - keyboardValue.CGRectValue().origin.y
        let duration = Double(dict.objectForKey(UIKeyboardAnimationDurationUserInfoKey) as! NSNumber)
        
        UIView.animateWithDuration(duration, animations: {
//            self.inputViewBottomContraint.constant = bottomDistance
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
            let cell:UUChatRightMessageCell = tableView.dequeueReusableCellWithIdentifier(rightCellId) as! UUChatRightMessageCell
            cell.configUIWithModel(num)
            return cell
        }
        else {
            let cell:UUChatLeftMessageCell = tableView.dequeueReusableCellWithIdentifier(leftCellId) as! UUChatLeftMessageCell
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


