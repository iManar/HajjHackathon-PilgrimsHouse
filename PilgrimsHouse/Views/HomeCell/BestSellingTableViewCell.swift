//
//  BestSellingTableViewCell.swift
//  PilgrimsHouse
//
//  Created by Zeinab Reda on 8/2/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import UIKit

class BestSellingTableViewCell: UITableViewCell {

    @IBOutlet weak var adImg: UIImageView!
    @IBOutlet weak var adName: UILabel!
    @IBOutlet weak var adPrice: UILabel!
    @IBOutlet weak var reserveBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func reserveBtnAction(_ sender: Any) {
        
    }
 

}
