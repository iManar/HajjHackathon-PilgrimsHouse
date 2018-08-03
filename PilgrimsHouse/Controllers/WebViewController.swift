//
//  WebViewController.swift
//  PilgrimsHouse
//
//  Created by tr on 8/3/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var status: String = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.title = "بعد السكن عن المناسك"
        var urlString: String
        switch status {
        case "0":
            urlString = "https://www.google.com/maps/dir/Jeddah/Mecca/@21.5163449,39.3770183,11z/data=!3m1!4b1!4m14!4m13!1m5!1m1!1s0x15c3d01fb1137e59:0xe059579737b118db!2m2!1d39.1925048!2d21.485811!1m5!1m1!1s0x15c21b4ced818775:0x98ab2469cf70c9ce!2m2!1d39.8579118!2d21.3890824!3e0"
        case "1":
            urlString = "https://www.google.com/maps/dir/Jeddah/Mecca/@21.5163449,39.3770183,11z/data=!3m1!4b1!4m14!4m13!1m5!1m1!1s0x15c3d01fb1137e59:0xe059579737b118db!2m2!1d39.1925048!2d21.485811!1m5!1m1!1s0x15c21b4ced818775:0x98ab2469cf70c9ce!2m2!1d39.8579118!2d21.3890824!3e0"
            
        default:
            urlString = "https://www.google.com/maps/dir/Jeddah/Mecca/@21.5163449,39.3770183,11z/data=!3m1!4b1!4m14!4m13!1m5!1m1!1s0x15c3d01fb1137e59:0xe059579737b118db!2m2!1d39.1925048!2d21.485811!1m5!1m1!1s0x15c21b4ced818775:0x98ab2469cf70c9ce!2m2!1d39.8579118!2d21.3890824!3e0"
            
        }
        if let url = URL(string: urlString) {
            let requestObj = URLRequest(url: url)
            webView.loadRequest(requestObj)
        }
        
    }


}
