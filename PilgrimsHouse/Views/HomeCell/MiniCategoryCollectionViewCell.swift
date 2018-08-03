//
//  MiniCategoryCollectionViewCell.swift
//  InstaSalla
//
//  Created by Atiaa on 4/18/17.
//  Copyright © 2017 InstaSalla. All rights reserved.
//

import UIKit


class MiniCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var back: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    override func draw(_ rect: CGRect) {
        self.nameLabel.textAlignment = .right
    }
    
    
    func updateWithJSONModel(image: UIImage, name: String){
        
        self.categoryImage.image = image
        self.nameLabel.text = name
    }
}
