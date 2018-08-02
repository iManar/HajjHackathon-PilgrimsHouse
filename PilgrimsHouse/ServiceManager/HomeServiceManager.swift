//
//  HomeServiceManager.swift
//  PilgrimsHouse
//
//  Created by Zeinab Reda on 8/2/18.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import UIKit

class HomeServiceManager: NSObject {
    
    func getHouses( completion:  @escaping (_:HouseDataResponse? , _:NSError?) -> Void) {
        
        ServiceProvider().sendUrl(showActivity: false, method: .get, URLString: Constants.Url.home_url, withQueryStringParameters: nil, withHeaders:["Content-Type":"application/json"]) { (response, error) in
            
            if error == nil {
                
                completion(HouseDataResponse(JSON: response as! [String: Any]),nil)
                
            } else {
                
               
                    completion(nil, error)
                

            }
            
        }
    }

}
