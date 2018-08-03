
//
//  HomeViewController.swift
//  InstaSalla
//
//  Created by hawy on 2/14/17.
//  Copyright (c) 2017 InstaSalla. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit



class HomeViewController: UIViewController {
    
    var itemsList : [Data] = []
    var cellHeights = [CGFloat]()
    
    private let refreshControl = UIRefreshControl()
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUIs()
        fetchData()
//        initBaseAbility()
    }
   
    func initUIs() {
        
        // Configure Refresh Control
        tableView.refreshControl = refreshControl
        refreshControl.tintColor = UIColor.Primary
        refreshControl.addTarget(self, action: #selector(fetchData), for: .valueChanged)
        
        tableView.registerCellNib(DailyDealsTableViewCell.self)
        tableView.registerCellNib(MiniCategoriesTableViewCell.self)
        tableView.registerCellNib(HomeTableCellView.self)
        
            
        let searchButton = UIBarButtonItem(image: #imageLiteral(resourceName: "search-ios"), style: .plain, target: self, action: nil)
        navigationController?.navigationItem.rightBarButtonItem = searchButton
    }
    
   
    
    // MARK: - API Calls
    @objc func fetchData() {
        
        addLoadingView()
        
        HomeServiceManager().getHouses { [weak self] (response, error)  in
            
            self?.removeLoadingView()
            DispatchQueue.main.async {
                self?.refreshControl.endRefreshing()
                if error == nil {
                    self?.itemsList = response?.data ?? []
                    self?.tableView.reloadData()
                } else {
                    
                }
            }
        }
    }
}



extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return 3
    }

    func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        if section > 1 {
            return itemsList.count
        }
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {

        case 1:
            
           let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MiniCategoriesTableViewCell.self)) as! MiniCategoriesTableViewCell
            DispatchQueue.main.async {
                cell.collectionView.reloadData()
                cell.collectionView.scrollToItem(at: IndexPath(row: 3, section: 0), at: .centeredHorizontally, animated: true)
            }

            return cell
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DailyDealsTableViewCell.self)) as! DailyDealsTableViewCell
            cell.itemsJson = itemsList
            DispatchQueue.main.async {
                cell.collectionView.reloadData()
                if self.itemsList.count-1 > 0 {
                    cell.collectionView.scrollToItem(at: IndexPath(row: self.itemsList.count-1, section: 0), at: .centeredHorizontally, animated: true)
                }
            }
            return cell

        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTableCellView.self)) as! HomeTableCellView
            cell.setupWithData(data: itemsList[indexPath.row])
            return cell
        }

    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 2 {
            let vc = DetailsViewController.instantiate(fromAppStoryboard: .Details)
            vc.dataModel = itemsList[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        switch indexPath.section {
        case 1:
            return 53
        case 0:
            return 230
        default:
            return 270
        }
    }

    // Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = (Bundle.main.loadNibNamed("BestsTableViewHeader", owner: self, options: nil)?[0] as? BestsTableViewHeader)

        switch(section){
        case 0:
            headerView?.titleLabel.text = "أماكن مقترحة"
        default:
            let view = UIView()
            view.backgroundColor = .clear
            return view
        }
        return headerView
    }
    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section{
        case 0:
            return 50.0
        default:
            return 8
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
}
