//
//  MiniCategoriesTableViewCell.swift
//  InstaSalla
//
//  Created by Atiaa on 4/19/17.
//  Copyright © 2017 InstaSalla. All rights reserved.
//

import UIKit


class MiniCategoriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName:"MiniCategoryCollectionViewCell", bundle:nil), forCellWithReuseIdentifier: "MiniCategoryCollectionViewCell")
    }
}


extension MiniCategoriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    //1
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //return searches.count
        return 1
    }
    
    //2
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //1
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "MiniCategoryCollectionViewCell",for: indexPath) as! MiniCategoryCollectionViewCell
        var image: UIImage
        var name: String
        switch indexPath.row {
        case 3:
            image = #imageLiteral(resourceName: "single-room-icon")
            name = "غرفة منفردة"
        case 2:
            image = #imageLiteral(resourceName: "double-room-icon")
            name = "غرفة مزدوجة"
        case 1:
            image = #imageLiteral(resourceName: "group-room-icon")
            name = "غرف متعددة"
        default:
            image = #imageLiteral(resourceName: "group-room-icon")
            name = "غرف عائلية"
        }
        cell.updateWithJSONModel(image: image, name: name)
           
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        (collectionView.cellForItem(at: indexPath) as! MiniCategoryCollectionViewCell).back.backgroundColor = UIColor.lightGray.withAlphaComponent(0.55)

//        let catItemVC = Constants.App.mainStoryboard.instantiateViewController(withIdentifier: "CategoryItemsViewController") as! CategoryItemsViewController
//
//        var index:Int
//        index = L102Language.currentAppleLanguage() == "ar" ? (itemsJson?.count)!-1-indexPath.item : indexPath.item
//
//        catItemVC.categoryID = itemsJson![index, "category_id"].stringValue
//        catItemVC.categoryName = itemsJson![index, "name"].stringValue
//        catItemVC.mainCategoriesJson = itemsJson
//        catItemVC.selectedCategoryIndex = L102Language.currentAppleLanguage() == "en"  ? indexPath.item : (itemsJson?.arrayValue.count)!-1 - indexPath.item
//
//        if let topController = ez.topMostVC {
//            topController.navigationController?.pushViewController(catItemVC, animated: true)
//        }
    }
    
}

extension MiniCategoriesTableViewCell : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return  CGSize(width: 160, height: 50)
    }

    // 4
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
