//
//  CustomTabBar.swift
//  PilgrimsHouse
//
//  Created by tr on 8/2/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import UIKit


enum CustomTabBar {
    
    static func systemStyle() -> UITabBarController {
        let tabBarController = UITabBarController()
        let v1 = HomeViewController()
        let v2 = HomeViewController()
        let v3 = HomeViewController()
        let v4 = HomeViewController()
        let v5 = HomeViewController()
        
        v5.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v4.tabBarItem = UITabBarItem.init(title: "Find", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
        v3.tabBarItem = UITabBarItem.init(title: "Photo", image: UIImage(named: "photo"), selectedImage: UIImage(named: "photo_1"))
        v2.tabBarItem = UITabBarItem.init(title: "Favor", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v1.tabBarItem = UITabBarItem.init(title: "Me", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.tabBar.shadowImage = nil
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        
        return tabBarController
    }


    
    static func customIrregularityStyle(delegate: UITabBarControllerDelegate?) -> CustomNavigationBar {
        let tabBarController = ESTabBarController()
        tabBarController.delegate = delegate
        tabBarController.title = "Irregularity"
        tabBarController.tabBar.shadowImage = UIImage(named: "transparent")
        tabBarController.tabBar.backgroundImage = UIImage(named: "background_dark")
//        tabBarController.shouldHijackHandler = {
//            tabbarController, viewController, index in
//            if index == 1 {
//                return true
//            }
//            return false
//        }
//        tabBarController.didHijackHandler = {
//            [weak tabBarController] tabbarController, viewController, index in
// 
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
//                let alertController = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
//                let takePhotoAction = UIAlertAction(title: "", style: .default, handler: nil)
//                alertController.addAction(takePhotoAction)
//                let selectFromAlbumAction = UIAlertAction(title: "Select from album", style: .default, handler: nil)
//                alertController.addAction(selectFromAlbumAction)
//                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//                alertController.addAction(cancelAction)
//                tabBarController?.present(alertController, animated: true, completion: nil)
//            }
//        }
        
        let v1 = MeViewController.instantiate(fromAppStoryboard: .Main)
        let v2 = SearchViewController.instantiate(fromAppStoryboard: .Main)
        let v3 = SearchViewController.instantiate(fromAppStoryboard: .Main)
        let v4 = SearchViewController.instantiate(fromAppStoryboard: .Main)
        let v5 = HomeViewController.instantiate(fromAppStoryboard: .Main)
        
        v5.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "الرئيسية", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
        v4.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "بحث", image: #imageLiteral(resourceName: "find"), selectedImage: #imageLiteral(resourceName: "find_1"))
        v3.tabBarItem = ESTabBarItem.init(ExampleIrregularityContentView(), title: nil, image: UIImage(named: "photo_verybig"), selectedImage: #imageLiteral(resourceName: "photo_verybig_1"))
        v2.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "المفضلة", image: UIImage(named: "favor"), selectedImage: UIImage(named: "favor_1"))
        v1.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "حسابي", image: UIImage(named: "me"), selectedImage: UIImage(named: "me_1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
        tabBarController.selectedIndex = 4
        let navigationController = CustomNavigationBar.init(rootViewController: tabBarController)
        tabBarController.title = "بيت الحجيج"
        
        return navigationController
    }

}
