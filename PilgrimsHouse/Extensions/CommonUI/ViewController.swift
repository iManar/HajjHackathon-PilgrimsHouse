//
//  ViewController.swift
//  OrangeFootballClub
//
//  Created by Alaa Taher on 1/11/17.
//  Copyright © 2017 Alaa Taher. All rights reserved.
//

import SVProgressHUD


extension UIViewController
{
    
   
    
    func showActivity()  {
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        actInd.center = self.view.center
        actInd.tag = 200
        actInd.hidesWhenStopped = true
        actInd.activityIndicatorViewStyle =
            UIActivityIndicatorViewStyle.whiteLarge
        actInd.color = UIColor.orange
        self.view.addSubview(actInd)
        actInd.startAnimating()
    }
    
    func hideActivity()  {
        if (self.view.viewWithTag(200) != nil)
        {
            self.view.viewWithTag(200)?.removeFromSuperview()
            
        }
    }
    func hideKeyboard()
    {
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    func addLabelNoData(noData:String)  {
        let label = UILabel(frame: CGRect.zero)
        label.text = noData
        label.textAlignment = .center
        label.tag = 100
        // label.backgroundColor = .red  // Set background color to see if label is centered
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        
        let widthConstraint = NSLayoutConstraint(item: label, attribute: .width, relatedBy: .equal,toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 250)
        
        let heightConstraint = NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal,toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30)
        
        let xConstraint = NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        
        let yConstraint = NSLayoutConstraint(item: label, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        
        NSLayoutConstraint.activate([widthConstraint, heightConstraint, xConstraint, yConstraint])
    }
    func removeLabelNoData()  {
        self.view.viewWithTag(100)?.removeFromSuperview()
    }
    
    // MARK: - Method Swizzling
    
    func proj_viewWillDisappear(animated: Bool) {
        self.proj_viewWillDisappear(animated: animated)
        let viewControllerName = NSStringFromClass(type(of: self))
        debugPrint("viewWillAppear: \(viewControllerName)")
        hideActivity()
        SVProgressHUD.dismiss()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
    }
    
    
}


