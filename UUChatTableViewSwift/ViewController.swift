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
    
    var _dataArray: NSMutableArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _dataArray = NSMutableArray(array: [])
        
        for var i=0; i<20; i++ {
            _dataArray.addObject(i%3==1 ? "right":"left")
        }
        
        chatTableView.registerNib(UINib(nibName: "UUChatLeftMessageCell", bundle: nil), forCellReuseIdentifier: "UUChatLeftMessageCell")
        chatTableView.registerNib(UINib(nibName: "UUChatRightMessageCell", bundle: nil), forCellReuseIdentifier: "UUChatRightMessageCell")
        chatTableView.estimatedRowHeight = 100;
    }
    
    
    // tableview delegate & dataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _dataArray.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if _dataArray.objectAtIndex(indexPath.row).isEqual("right"){
            let cell:UUChatRightMessageCell = tableView.dequeueReusableCellWithIdentifier("UUChatRightMessageCell") as! UUChatRightMessageCell
            cell.configUIWithModel();
            return cell;
        }
        else {
            let cell:UUChatLeftMessageCell = tableView.dequeueReusableCellWithIdentifier("UUChatLeftMessageCell") as! UUChatLeftMessageCell
            cell.configUIWithModel();
            return cell;
        }
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return  CGFloat(random()%200) + 100.0;
//    }
}

