//
//  DetailsViewController.swift
//  PilgrimsHouse
//
//  Created by Zeinab Reda on 8/2/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataModel: Data?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func reserveBtnAction(_ sender: Any) {
    }
}

extension DetailsViewController : UITableViewDelegate , UITableViewDataSource
{

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")

        if indexPath.section == 0
        {
            if indexPath.row == 0
            {
                 let detailCell = tableView.dequeueReusableCell(withIdentifier: "cell_image") as! DetailsTableViewCell

                detailCell.cell_image.image = #imageLiteral(resourceName: "air-conditioner")
                detailCell.cell_title.text = "تكييف"
                return detailCell
            }
                
            else if indexPath.row == 1
            {
                let detailCell = tableView.dequeueReusableCell(withIdentifier: "cell_image") as! DetailsTableViewCell

                detailCell.cell_image.image = #imageLiteral(resourceName: "wifi-icon")
                detailCell.cell_title.text = "واي فاي"
                return detailCell
                
            }
        }
        else if indexPath.section == 1
        {
            if indexPath.row == 0
            {
                cell?.textLabel?.text = "فندق"
            }
        }
        else if indexPath.section == 2
        {
            if indexPath.row == 0
            {
                let detailCell = tableView.dequeueReusableCell(withIdentifier: "cell_image") as! DetailsTableViewCell
                
                detailCell.cell_image.image = #imageLiteral(resourceName: "location-icon")
               detailCell.cell_title.text = "٣ شارع حراء ، المدينه المنوره"
                return detailCell
            }
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableCell(withIdentifier: "header")
        if section == 0
        {
            header?.textLabel?.text = "التسهيلات الاساسيه"
        }
        else if section == 1
        {
            header?.textLabel?.text = "نوع مكان الاقامه "

        }
        else if section == 2
        {
            header?.textLabel?.text = "الموقع"

        }
        return header

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0
        {
            return 2
            
        }
        else
        {
            return 1
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
}
