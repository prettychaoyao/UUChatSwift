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
    var headImage:UIImage!
    
    var text:String?
    var image:UIImage?
    var voice:NSData?
    var VoiceSecond:String?
    
    class func creatMessageFromMeByText(text:String) -> UUChatModel{
        let model = UUChatModel()
        model.messageType = .Text
        model.text = text
        model.configMeBaseInfo()
        return model
    }
    
    class func creatMessageFromMeByImage(image:UIImage) -> UUChatModel{
        let model = UUChatModel()
        model.messageType = .Image
        model.image = image
        model.configMeBaseInfo()
        return model
    }
    
    class func creatMessageFromMeByVoice(voice:NSData) -> UUChatModel{
        let model = UUChatModel()
        model.messageType = .Voice
        model.voice = voice
        model.VoiceSecond = "5"
        model.configMeBaseInfo()
        return model
    }
    
    private func configMeBaseInfo() {
        self.from = .Me
        self.userName = "Daniel"
        self.time = random()%2==1 ? NSDate.init(timeIntervalSince1970: NSTimeInterval(random()%1000)).description : ""
        self.headImage = UIImage(named: "headImage")
    }
    
    class func creatRandomArray(count count:Int) -> [UUChatModel] {
        var array = [UUChatModel]()
        for _ in 0...(count) {
            let model:UUChatModel = UUChatModel()
            let type = random()%2
            model.messageType = type==0 ? .Text : .Image
            if type==0 {
                model.text = UUChatModel.randomStr()
            } else {
                model.image = UIImage(named: "headImage")
            }
            model.from = random()%2==0 ? .Me : .Other
            model.userName = model.from == .Me ? "Daniel":"Sister"
            model.time = random()%2==1 ? NSDate.init(timeIntervalSince1970: NSTimeInterval(random()%1000)).description : ""
            model.headImage = UIImage(named: "headImage")
            array.append(model)
        }
        return array
    }
    
    class func randomStr() -> String {
        let str:NSMutableString = "A scroll view tracks the movements of fingers and adjusts the origin accordingly. The view that is showing its content “through” the scroll view draws that portion of itself based on the new origin, which is pinned to an offset in the content view. The scroll view itself does no drawing except for displaying vertical and horizontal scroll indicators. The scroll view must know the size of the content view so it knows when to stop scrolling; by default, it “bounces” back when scrolling exceeds the bounds of the content"
        let index: Int = random()%100 + 5
        return str.substringToIndex(index)
    }
}


