//
//  HomeViewController.swift
//  PilgrimsHouse
//
//  Created by tr on 8/2/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {


    var houses:[Data] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        HomeServiceManager().getHouses {[weak self] (response, error)  in 
            if error == nil
            {
                self?.houses = (response?.data)!
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
