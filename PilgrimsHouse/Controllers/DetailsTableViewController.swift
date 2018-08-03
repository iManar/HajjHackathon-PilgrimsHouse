//
//  DetailsTableViewController.swift
//  PilgrimsHouse
//
//  Created by Zeinab Reda on 8/3/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import UIKit

class DetailsTableViewController: UITableViewController {
    var dataModel: Data?

    @IBOutlet weak var adImg: UIImageView!
    @IBOutlet weak var adName: UILabel!
    @IBOutlet weak var roomLocation: UILabel!
    @IBOutlet weak var roomType: UILabel!
    @IBOutlet weak var adDesc: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "بيت الحجيج"
        self.adImg.sd_setImage(with: URL(string:  (dataModel?.mediaGallery?[0])!), placeholderImage: #imageLiteral(resourceName: "default"))
        adName.text = dataModel?.name
        adDesc.text = dataModel?.descriptionField
        roomLocation.text = dataModel?.address
        roomType.text = dataModel?.houseType
    }

    @IBAction func mapBtnAction(_ sender: Any) {
        self.present(MapViewController.instantiate(fromAppStoryboard: .Map), animated: true, completion: nil)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

}
