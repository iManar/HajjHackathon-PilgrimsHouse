//
//  HomeViewController.swift
//  PilgrimsHouse
//
//  Created by tr on 8/2/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
//
//    // MARK: - View lifecycle
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        initUIs()
//        self.initBaseAbility()
//        self.fetchData()
//    }
//
//    func initUIs() {
//
////        tableView.register(UINib(nibName: "DailyDealsTableViewCell", bundle: nil), forCellReuseIdentifier: "DailyDealsTableViewCell")
////        tableView.register(UINib(nibName: "MiniCategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "MiniCategoriesTableViewCell")
//        tableView.registerCellNib(HomeTableViewCell.self)
//        tableView.registerCellNib(BestSellingTableViewCell.self)
////        tableView.register(UINib(nibName: "BannerTableViewCell", bundle: nil), forCellReuseIdentifier: "BannerTableViewCell")
////        tableView.register(UINib(nibName: "NewArrivalTableViewCell", bundle: nil), forCellReuseIdentifier: "NewArrivalTableViewCell")
//    }
//
//
//
}
//
//
//extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//
//    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
//        if section == 0 {
//            return 1
//        }
//        return 5
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var reuseIdentifier = ""
//
//        switch indexPath.section {
//        case 0:
//
//            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: BestSellingTableViewCell.self)) as! BestSellingTableViewCell
////            cell.setupWithModel(moviesListPresenter.moviesList[indexPath.row])
//            return cell
//
//
//
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        switch indexPath.section {
//        case 0: // banners
//            if(homeJson?["model","top_slider"] != JSON.null){
//                return 210
//            }else{
//                return 0
//            }
//        case 1: // daily deals
//            if(homeJson?["model","categories"] != JSON.null){
//                return 53
//            }else{
//                return 0
//            }
//
//        case 2: // offers
//            if(homeJson?["model","best_offers"] != JSON.null){
//                return Defaults[.offerCategoryId] == "" ? 230 : 345
//            }else{
//                return Defaults[.offerCategoryId] == "" ? 0 : 115
//            }
//        case 3: // best seller
//            if(homeJson?["model","best_seller"] != JSON.null){
//                let x = homeJson?["model","best_seller"].arrayValue.count
//                return CGFloat( 224 * (ceil(Double(x!)/2) )  + 16)
//            }else{
//                return 0
//            }
//
//        case 4: // Category
//            if(homeJson?["model","categories"] != JSON.null){
//                return CGFloat( 150 * ((homeJson?["model","categories"].arrayValue.count)! ) )
//            }else{
//                return 0
//            }
//
//        default:
//            return 200
//        }
//    }
//
//    // Header
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//
//        let headerView = (Bundle.main.loadNibNamed("BestsTableViewHeader", owner: self, options: nil)?[0] as? BestsTableViewHeader)
//
//        switch(section){
//        case 2:
//            headerView?.titleLabel.text = "Best Offers Today".localized
//            headerView?.headerImage.image = UIImage(named: "offers")
//            headerView?.allButton.setTitle("See All".localized, for:.normal)
//            headerView?.allButton.isHidden = false
//            headerView?.selectTab = 1
//
//        case 3:
//            headerView?.titleLabel.text = "Best Selling".localized
//            headerView?.headerImage.image = UIImage(named: "bestsale")
//            headerView?.allButton.isHidden = true
//        case 4:
//            headerView?.titleLabel.text = "Category".localized
//            headerView?.headerImage.image = UIImage(named: "category")
//            headerView?.allButton.setTitle("See All".localized, for:.normal)
//            headerView?.allButton.isHidden = false
//            headerView?.selectTab = 2
//
//        default:
//
//            return nil
//        }
//        return headerView
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        switch section{
//        case 0:
//            return 0
//        case 1:
//            return 8
//        case 2 :
//            if(homeJson?["model","best_offers"] != JSON.null){
//                return 50.0
//            }else{
//                return 0
//            }
//        case 3:
//            if(homeJson?["model","best_seller"] != JSON.null){
//                return 50.0
//            }else{
//                return 0
//            }
//        case 4:
//            if(homeJson?["model","categories"] != JSON.null){
//                return 50.0
//            }else{
//                return 0
//            }
//        default:
//            return 8
//        }
//    }
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0.0
//    }
//}
//}
//
//
//
//        var homeJson : JSON?
//        var cellHeights = [CGFloat]()
//
//
//
//
//
//
//
//        // MARK: - API Calls
//        @objc func fetchData(){
//            addLoadingView()
//            APIClient().getRequestFromURI(uri:"/index/home",params: ["":""]) { (success, json) in
//                if success {
//                    self.homeJson = json
//                    self.setPushWooshUserTags()
//                    self.storeLogo.af_setImage(withURL: URL(string:json["model","store_info", "logo"].stringValue)!)
//                    self.saveDefaultsData()
//                    self.removeLoadingView()
//                    self.tableView.reloadData()
//                    self.refreshControl.endRefreshing()
//                }else{
//                    self.refreshControl.endRefreshing()
//                    self.removeLoadingView()
//                    json[GlobalConstants.ServiceResponse.wsMsgKey].stringValue == "" ? debugPrint("") : self.showErrorToast(message: json[GlobalConstants.ServiceResponse.wsMsgKey].stringValue)
//                }
//            }
//        }
//
//
//
//        // MARK: - Display logic
//        @IBAction func selectStoreTapped(_ sender: UIButton) {
//
//            if Defaults[.langChanged] == true {
//                debugPrint("🤦‍♀️🤦‍♀️🤦‍♀️")
//                Defaults[.langChanged] = false
//                navigationController?.pushViewController(StoresViewController.instantiate(fromAppStoryboard: .Main), animated: true)
//                return
//            }
//            dismiss(animated: true, completion: nil)
//        }
//    }
//
//
