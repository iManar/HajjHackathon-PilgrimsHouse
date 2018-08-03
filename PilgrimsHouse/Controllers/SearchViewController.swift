//
//  SearchViewController.swift
//  PilgrimsHouse
//
//  Created by tr on 8/3/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import UIKit
import SCLAlertView

func getCustomizedAlertView() -> SCLAlertView {
    
    let appearance = SCLAlertView.SCLAppearance(
        kTitleFont: UIFont.tulipBoldFont(fontSize: 18)!,
        kTextFont: UIFont.tulipRegularFont(fontSize: 14)!,
        kButtonFont: UIFont.tulipBoldFont(fontSize: 16)!,
        showCloseButton: false
    )
    
    return SCLAlertView(appearance: appearance)
}

func showErrorAlertView(_ msg: String, title: String = "بيت الحجيج") {
    
    let alert = getCustomizedAlertView()
    alert.addButton("تم") {}
    alert.showError(title, subTitle: msg)
}


func showNoticeAlertView(_ msg: String, title: String = "بيت الحجيج", confirmAction: (()->())?, discardAction: (()->())? = nil) {
    
    let alert = getCustomizedAlertView()
    alert.addButton("YES") {
        confirmAction?()
    }
    alert.addButton("NO") {
        discardAction?()
    }
    alert.showNotice(title, subTitle: msg)
}


func showSuccessAlertView(_ msg: String, title: String = "بيت الحجيج") {
    
    let alert = getCustomizedAlertView()
    alert.addButton("تم") {}
    alert.showSuccess(title, subTitle: msg)
}



class SearchViewController: UIViewController {
    
    var itemsList : [Data] = []
    var filteredData: [Data] = [] {
        didSet {
            if filteredData.count == 0 {
                searchBar.text = ""
                filteredData = itemsList
                tableView.reloadData()
                showErrorAlertView("لا يوجد نتائج بحث .. برجاء استخدام كلمة بحث اخري. .")
            }
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak private var searchBar: UISearchBar!{
        didSet{
            let textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
            textFieldInsideSearchBar?.font = UIFont.tulipRegularFont(fontSize: 15)
            textFieldInsideSearchBar?.textAlignment = .center
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
        tableView.registerCellNib(HomeTableCellView.self)
    }
    
    @objc func fetchData() {
        
        addLoadingView()
        
        HomeServiceManager().getHouses { [weak self] (response, error)  in
            
            self?.removeLoadingView()
            DispatchQueue.main.async {
                if error == nil {
                    self?.itemsList = response?.data ?? []
                    self?.filteredData = self?.itemsList ?? []
                    self?.tableView.reloadData()
                }
            }
        }
    }
}


// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .none, animated: true)
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        
        filteredData = searchBar.text!.isEmpty ? [] : itemsList.filter({(data: Data) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return data.options!.contains(searchBar.text!)
        })
        
        tableView.reloadData()
    }
}



extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTableCellView.self)) as! HomeTableCellView
        cell.setupWithData(data: filteredData[indexPath.row])
        return cell
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 2 {
            let vc = DetailsViewController.instantiate(fromAppStoryboard: .Details)
            vc.dataModel = filteredData[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 270
    }
    
}
