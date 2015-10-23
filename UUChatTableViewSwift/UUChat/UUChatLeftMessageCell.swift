//
//  LeftMessageCell.swift
//  UUChatTableViewSwift
//
//  Created by XcodeYang on 8/13/15.
//  Copyright © 2015 XcodeYang. All rights reserved.
//

import UIKit

@objc(UUChatLeftMessageCell)
class UUChatLeftMessageCell: UITableViewCell {

    internal var dateLabel: UILabel!
    internal var headImageView: UIButton!
    internal var nameLabel: UILabel!
    internal var contentButton: UIButton!
    
    internal var contentLabel: UILabel!
        
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        
    }

    func configUIWithModel(num: NSInteger){
        
        // 日期
        dateLabel = UILabel()
        contentView.addSubview(dateLabel)
        dateLabel.font = UIFont.systemFontOfSize(12)
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
            make.leading.equalTo(10)
            make.top.equalTo(dateLabel).offset(20)
        }
        
        // 内容frame辅助
        contentLabel = UILabel()
        contentView.addSubview(contentLabel)
        contentLabel.font = UIFont.systemFontOfSize(14)
        contentLabel.numberOfLines = 0
        contentLabel.textColor = UIColor.grayColor()
        contentLabel.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(90)
            make.trailing.equalTo(-40)
            make.top.equalTo(headImageView).offset(10)
            make.bottom.equalTo(-20).priority(250)
        }
        
        // 内容视图
        contentButton = UIButton()
        contentView.insertSubview(contentButton, belowSubview: contentLabel)
        contentButton.setBackgroundImage(UIImage(named: "left_message_back"), forState: UIControlState.Normal)
        contentButton.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(contentView).offset(70)
            make.trailing.equalTo(contentLabel.snp_trailing).offset(10)
            make.top.equalTo(headImageView)
            make.bottom.equalTo(contentLabel.snp_bottom).offset(10)
        }
        
        dateLabel.text = random()%2==0 ? "2014-09-21 18:32":""
        contentLabel.text = getRandomStr(num) as String
    }
    
    func getRandomStr(num: NSInteger) -> NSString{
        let str = "两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在"
        return (str as NSString).substringToIndex(num)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        for view:UIView in contentView.subviews {
            view.removeFromSuperview()
        }
    }
}
