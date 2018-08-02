//
//  Helper.swift
//  HubMe
//
//  Created by Zeinab Reda on 11/15/16.
//  Copyright © 2016 Alaa Taher. All rights reserved.
//

import UIKit
import SCLAlertView
import Foundation

import JDropDownAlert

class Helper: NSObject {


    static func showFloatAlert(title: String, subTitle: String, type: Int) {
        
        let alert = JDropDownAlert()
        
        alert.alertWith(title)
        //        alert.titleFont = UIFont(name: "Helvetica", size: 20)!
        //        alert.messageFont = UIFont.italicSystemFont(ofSize: 12)
        
        if type == Constants.AlertType.AlertError {
            alert.alertWith(title, message: subTitle, topLabelColor: UIColor.white, messageLabelColor: UIColor.darkGray, backgroundColor: UIColor.red)
        } else if type == Constants.AlertType.AlertSuccess {
            alert.alertWith(title, message: subTitle, topLabelColor: UIColor.white, messageLabelColor: UIColor.darkGray, backgroundColor: UIColor.green)
            
        } else if type == Constants.AlertType.Alertinfo {
            alert.alertWith(title, message: subTitle, topLabelColor: UIColor.white, messageLabelColor: UIColor.darkGray, backgroundColor: UIColor.blue)
            
        }
        alert.didTapBlock = {
            debugPrint("Top View Did Tapped")
        }
    }
}
