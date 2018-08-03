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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            let alertController = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
            let takePhotoAction = UIAlertAction(title: "المسافة الي الحرم المكي", style: .default, handler: { _ in
                let vc = WebViewController.instantiate(fromAppStoryboard: .Main)
                 self.navigationController?.pushViewController(vc, animated: true)
            })
            alertController.addAction(takePhotoAction)
            let selectFromAlbumAction = UIAlertAction(title: "المسافة الي عرفات", style: .default, handler: { _ in
                let vc = WebViewController.instantiate(fromAppStoryboard: .Main)
                vc.status = "1"
                self.navigationController?.pushViewController(vc, animated: true)
            })
            alertController.addAction(selectFromAlbumAction)
            let selectFromAlbumAction2 = UIAlertAction(title: "المسافة الي بوابات مني", style: .default, handler: { _ in
                let vc = WebViewController.instantiate(fromAppStoryboard: .Main)
                vc.status = "2"
                self.navigationController?.pushViewController(vc, animated: true)
            })
            alertController.addAction(selectFromAlbumAction2)
            let cancelAction = UIAlertAction(title: "إلغاء", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }

        
    }
    
    @objc func onBannerPressed(_ sender :Any){
        
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
