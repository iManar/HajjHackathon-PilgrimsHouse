//
//  ServiceProvider.swift
//  Intercom
//
//  Created by Zeinab Reda on 3/11/17.
//  Copyright © 2017 Zeinab Reda. All rights reserved.
//

import Alamofire
import SVProgressHUD

class ServiceProvider {
    
    
    func sendUrl(showActivity: Bool, method: HTTPMethod, URLString: String, withQueryStringParameters parameters: [String: AnyObject]?, withHeaders headers: [String: String]?, paramEncoding: ParameterEncoding? = JSONEncoding.default, completionHandler completion:@escaping (_ :NSObject?, _ :NSError?) -> Void) {
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 60
        
        manager.request(URLString, method: method, parameters: parameters, encoding: paramEncoding!, headers: headers).responseJSON { (response) in
            debugPrint("Request: \(String(describing: response.request))")
            debugPrint("Headers: \(String(describing: response.request?.allHTTPHeaderFields))")
            if method == .post  || method == .put {
                print("Body Paramters: \(NSString(data: (response.request?.httpBody)!, encoding: String.Encoding.utf8.rawValue) ?? "")")
            }
            
            debugPrint("Response: \(String(describing: response.result.value))")
            
            debugPrint("Error: \(String(describing: response.error))")
            
            NotificationCenter.default.addObserver(self, selector: #selector(self.statusManager), name: .flagsChanged, object: Network.reachability)
            if self.updateUserInterface() {
                
                switch(response.result) {
                    
                case .success(_):
                    
                  
                        if let data = response.result.value {
                            completion(data as? NSObject, nil)
                            
                        }
                    
                case .failure(let error):
                    
                   
                        Helper.showFloatAlert(title: "حدث خطا", subTitle: "", type: Constants.AlertType.AlertError)
                     
                    
                    break
                    
                }
                
            }
        }
        
    }
    

    func updateUserInterface() -> Bool {
        guard let status = Network.reachability?.status else { return false }
        switch status {
        case .unreachable:
            Helper.showFloatAlert(title: "لا يوجد اتصال بالانترنت", subTitle: "", type: Constants.AlertType.AlertError)
            return false
        case .wifi:
            print("Connected")
        case .wwan:
            print("Connected")
            
        }
        print("Reachability Summary")
        print("Status:", status)
        print("HostName:", Network.reachability?.hostname ?? "nil")
        print("Reachable:", Network.reachability?.isReachable ?? "nil")
        print("Wifi:", Network.reachability?.isReachableViaWiFi ?? "nil")
        return true
    }
    @objc func statusManager(_ notification: Notification) {
        updateUserInterface()
    }
    
}
