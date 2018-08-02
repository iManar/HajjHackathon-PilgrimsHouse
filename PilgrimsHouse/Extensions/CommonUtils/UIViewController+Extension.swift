//
//  UIViewController+Extension.swift
//  CUAEMoviesApp
//
//  Created by Manar Magdy on 7/14/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController: NVActivityIndicatorViewable {
    
    class var viewControllerIdentifier : String {
        return "\(self)"
    }
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        
        return appStoryboard.viewController(viewControllerClass: self)
    }
    
    func addLoadingView()  {
        DispatchQueue.main.async {
            let size = CGSize(width: 30, height: 30)
            NVActivityIndicatorView.DEFAULT_COLOR = UIColor.Primary
            self.startAnimating(size, message: "", type: NVActivityIndicatorType(rawValue: 12)!)
        }
    }
    
    func removeLoadingView() {
        self.stopAnimating()
    }
    
}


enum AppStoryboard : String {
    
    case Main
    case Map
    
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type, function : String = #function, line : Int = #line, file : String = #file) -> T {
        let viewControllerIdentifier = (viewControllerClass as UIViewController.Type).viewControllerIdentifier
        guard let scene = instance.instantiateViewController(withIdentifier: viewControllerIdentifier) as? T else {
            fatalError("ViewController with identifier \(viewControllerIdentifier), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        return scene
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}
