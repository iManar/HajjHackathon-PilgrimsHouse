//
//  ProductCollectionViewCell.swift
//  InstaSalla
//
//  Created by hawy on 1/9/17.
//

import UIKit
import SDWebImage

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var oldPriceLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
//    @IBOutlet weak var addToCartView: AddToCartView!
    @IBOutlet weak var plusminusbtns: UIStackView!
    @IBOutlet weak var addToCartBtn: UIButton!
    
    var seconds: Int!
    
    
    override func draw(_ rect: CGRect) {
        setupAppearance()
    }
    
    func setupAppearance(){
        
//        self.plusminusbtns.semanticContentAttribute = .forceLeftToRight
        self.contentView.layer.borderWidth = 1
//        self.borderColor = .grayInsta
        productImageView.contentMode = .scaleToFill
        self.oldPriceLbl.textAlignment = .right
        self.priceLbl.textAlignment = .right
        self.titleLbl.textAlignment = .right
        oldPriceLbl.isHidden = true
        
        contentView.layer.borderWidth = 0.5
        contentView.layer.borderColor =  UIColor(hex: 0xBCBCBC).withAlphaComponent(0.5).cgColor
    }
    
    func updateWithJSONModel(json: Data) {
        
        titleLbl.text = json.name
        priceLbl.text = json.price
        if let url = json.thumbnail {
            productImageView.sd_setImage(with: URL(string: url), placeholderImage: #imageLiteral(resourceName: "default"))
        }
//        addToCartView.productID = json["entity_id"].stringValue
//        addToCartView.productJson = json
//        addToCartView.inStock =   json["stock_level"].intValue > 0 ? true : false
//        addToCartView.checkIfAddedToCart()

        convertToDeal(oldPrice:  json.oldPrice! + " ريال")
        priceLbl.text = json.price! + " ريال"
    }
    
    func convertToDeal(oldPrice:String) {
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: oldPrice)
        attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        attributeString.addAttribute(NSAttributedStringKey.baselineOffset, value: 0, range: NSMakeRange(0, attributeString.length))
        attributeString.addAttribute(NSAttributedStringKey.font, value: UIFont.tulipRegularFont(fontSize: 14), range: NSRange(location: 0, length: attributeString.length))
        oldPriceLbl.attributedText = attributeString
        oldPriceLbl.isHidden = false
    }
    
    @IBAction func addToCartTapped(_ sender: Any) {
        
    }
    
}
