//
//  LeftMessageCell.swift
//  UUChatTableViewSwift
//
//  Created by XcodeYang on 8/13/15.
//  Copyright © 2015 XcodeYang. All rights reserved.
//

import UIKit

class UUChatLeftMessageCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var headImageView: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentButton: UIButton!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var contentHeightContraint: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentButton.titleLabel?.numberOfLines = 0;
        self.contentButton.contentEdgeInsets = UIEdgeInsetsMake(4, 29, 4, 9)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configUIWithModel(){
        self.dateLabel.text = random()%2==0 ? "2014-09-21 18：32":""
        self.contentLabel.text = self.getRandomStr() as String
    }
    
    func getRandomStr() -> NSString{
        let str = "两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在两者互转的一种可行的途径是在"
        return (str as NSString).substringToIndex(random()%100+5)
    }
}
