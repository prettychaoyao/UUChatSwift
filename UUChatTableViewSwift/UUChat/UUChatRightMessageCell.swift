//
//  UUChatRightMessageCell.swift
//  UUChatTableViewSwift
//
//  Created by XcodeYang on 8/13/15.
//  Copyright © 2015 XcodeYang. All rights reserved.
//

import UIKit

class UUChatRightMessageCell: UITableViewCell {

    internal var dateLabel: UILabel!
    internal var headImageView: UIButton!
    internal var nameLabel: UILabel!
    internal var contentButton: UIButton!
    
    internal var contentLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        // 日期
        dateLabel = UILabel()
        contentView.addSubview(dateLabel)
        dateLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        dateLabel.textColor = UIColor.grayColor()
        dateLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(contentView)
            make.centerX.equalTo(contentView)
        }
        
        // 头像
        headImageView = UIButton()
        contentView.addSubview(headImageView)
        headImageView.layer.borderWidth = 4
        headImageView.layer.borderColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5).CGColor
        headImageView.layer.cornerRadius = 25
        headImageView.clipsToBounds = true
        headImageView.setImage(UIImage(named: "headImage"), forState: UIControlState.Normal)
        headImageView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.trailing.equalTo(-10)
            make.top.equalTo(dateLabel).offset(20)
        }
        
        // 内容frame辅助
        contentLabel = UILabel()
        contentView.addSubview(contentLabel)
        contentLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
        contentLabel.numberOfLines = 0
        contentLabel.textColor = UIColor.whiteColor()
        contentLabel.snp_makeConstraints { (make) -> Void in
            make.trailing.equalTo(-90)
            make.width.lessThanOrEqualTo(contentView).multipliedBy(0.6)
            make.top.equalTo(headImageView).offset(10)
            make.bottom.equalTo(-20).priorityLow()
        }
        
        // 内容视图
        contentButton = UIButton()
        contentView.insertSubview(contentButton, belowSubview: contentLabel)
        contentButton.setBackgroundImage(UIImage(named: "right_message_back"), forState: UIControlState.Normal)
        contentButton.snp_makeConstraints { (make) -> Void in
            make.trailing.equalTo(contentView).offset(-70)
            make.left.equalTo(contentLabel.snp_left).offset(-10)
            make.top.equalTo(headImageView)
            make.bottom.equalTo(contentLabel.snp_bottom).offset(10)
        }
    }
    
    func configUIWithModel(num: NSInteger){
        
        dateLabel.text = num%3==0 ? "2014-09-21 18:32":""
        contentLabel.text = getRandomStr(num) as String
    }
    
    func getRandomStr(num: NSInteger) -> NSString{
        let str = "不仅是学生申请英国大学的必须材料，也是申请奖学金的重要标准之一。因为在英国招生官的眼中，只有克服语言问题， 外国学生才能完全适应异国的求学生活，同时雅思考试的分数也是反映考生学习、思维能力高低的重要参考，所以很多英国大学都将雅思成绩当做给学生颁发奖学金 的重要标准。众所周知，国外的大学普遍比较重视对中国学生实践能力的考察，尤其是申请英国硕士，有些名牌大学的商学院甚至不接收没有工作经验的申请人，可见 拥有丰富实践经验的学生将更有优势。提醒广大英国留学生：如果学生想申请助研金和助教金，具有助教与助研的工作经验则是十分必要的"
        return (str as NSString).substringToIndex(num)
    }
}
