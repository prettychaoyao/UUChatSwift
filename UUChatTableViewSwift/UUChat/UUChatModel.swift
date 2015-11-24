//
//  UUChatModel.swift
//  UUChatTableViewSwift
//
//  Created by 杨志平 on 11/22/15.
//  Copyright © 2015 XcodeYang. All rights reserved.
//

import UIKit

enum UUChatFrom : Int {
    case Me
    case Other
}

enum UUChatMessageType : Int {
    case Text
    case Image
    case Voice
//    case Video
//    case Map
}

class UUChatModel: AnyObject {
    var from:UUChatFrom = .Me
    var messageType:UUChatMessageType = .Text
    var userName:String!
    var time:String!
    var headImage:String!
    
    var content:String?
    var image:String?
    var voice:String?
    var VoiceSecond:String?
}


