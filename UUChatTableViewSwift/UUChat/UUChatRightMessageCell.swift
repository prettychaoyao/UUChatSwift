//
//  UUChatRightMessageCell.swift
//  UUChatTableViewSwift
//
//  Created by XcodeYang on 8/13/15.
//  Copyright © 2015 XcodeYang. All rights reserved.
//

import UIKit

class UUChatRightMessageCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var headImageView: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentButton: UIButton!
    
    @IBOutlet weak var contentLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.None
        self.contentButton.titleLabel?.numberOfLines = 0;
        self.contentButton.contentEdgeInsets = UIEdgeInsetsMake(4, 29, 4, 9)
    }
    
    func configUIWithModel(num: NSInteger){
        self.dateLabel.text = random()%2==0 ? "2014-09-21 18:32":""
        self.contentLabel.text = self.getRandomStr(num) as String

    }
    
    func getRandomStr(num: NSInteger) -> NSString{
        let str = "两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在"
        return (str as NSString).substringToIndex(num)
    }
}
