//
//  DailyDealsTableViewCell.swift
//  InstaSalla
//
//  Created by hawy on 2/10/17.
//  Copyright (c) 2017 InstaSalla. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

class DailyDealsTableViewCell: UITableViewCell {
    
    
    var parent: HomeViewController!
    var itemsJson : [Data]?
    @IBOutlet weak var cvHConst: NSLayoutConstraint!
    @IBOutlet weak var dealsImageHConst: NSLayoutConstraint!
    @IBOutlet weak var dealsImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    // MARK: - Object lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.isPagingEnabled = false
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.onBannerPressed))
        dealsImage.addGestureRecognizer(tap)
        dealsImage.isUserInteractionEnabled = true
        // Register Cell
        collectionView.register(UINib(nibName:"ProductCollectionViewCell", bundle:nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
    }
    
    @objc func onBannerPressed(_ sender :Any){
        parent.tabBarController?.selectedIndex = 1
    }
    // MARK: - Event handling
    
    // MARK: - Display logic
    
}

extension DailyDealsTableViewCell:UICollectionViewDataSource,UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //2
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        guard let json = itemsJson else {
            return 0
        }
        return json.count
    }
    //3
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell",
                                                      for: indexPath) as! ProductCollectionViewCell
        cell.updateWithJSONModel(json: itemsJson![indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let productVC = ProductDetailsViewController.instantiate(fromAppStoryboard: .Details)
//        if let topController = ez.topMostVC {
//            productVC.productJson = itemsJson![indexPath.item]
//            productVC.productID = itemsJson![indexPath.item,"entity_id"].stringValue
//            topController.navigationController?.pushViewController(productVC, animated: true)
//        }
    }
}

extension DailyDealsTableViewCell : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return  self.itemsJson?.count == 2 ? CGSize(width: (self.frame.width/2)-4, height: 224) : CGSize(width: (self.frame.width/2.2)-8, height: 224)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // return sectionInsets.left
        return 8
    }
}

