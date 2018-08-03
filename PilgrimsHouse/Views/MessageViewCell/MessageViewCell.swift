//
//  MessageViewCell.swift
//  سلتي
//
//  Created by Zeinab Reda on 10/24/17.
//  Copyright © 2017 Orange. All rights reserved.
//

import UIKit
class MessageViewCell: UITableViewCell {
        
    @IBOutlet weak var messageBack: UIView!
    @IBOutlet weak var messages: UILabel!
    @IBOutlet weak var messageTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.messageBack.layer.cornerRadius = 10

        
    }
}
