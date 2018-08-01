//
//  HomeTableViewCell.swift
//  PilgrimsHouse
//
//  Created by Zeinab Reda on 8/2/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var houseImg: UIImageView!
    @IBOutlet weak var adName: UILabel!
    @IBOutlet weak var houseType: UILabel!
    @IBOutlet weak var houseRate: UIView!
    @IBOutlet weak var houseLocation: UILabel!
    @IBOutlet weak var housePrice: UILabel!
    
    @IBOutlet weak var sellerImg: UIImageView!
    @IBOutlet weak var sellerName: UILabel!
    
    @IBOutlet weak var createOn: UILabel!
    @IBOutlet weak var sellerRate: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
