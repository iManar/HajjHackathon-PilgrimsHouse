//
//  HomeTableViewCell.swift
//  PilgrimsHouse
//
//  Created by Zeinab Reda on 8/2/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import UIKit

class HomeTableCellView: UITableViewCell {
    
    
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
    
    func setupWithData(data: Data) {
        
        houseImg.sd_setImage(with: URL(string: data.thumbnail!), placeholderImage: #imageLiteral(resourceName: "default"))
        houseType.text = data.houseType
        adName.text = data.name
        housePrice.text = data.price! + " ريال"
        
        sellerImg.sd_setImage(with: URL(string: (data.owner?.image)!), placeholderImage: #imageLiteral(resourceName: "default"))
        sellerName.text = data.owner?.name
        createOn.text = "عرضت في " + data.owner!.createdOn!
        
        
    }
    

}
