//
//  HotelMapDetailsView.swift
//  JazHotels
//
//  Created by Zeinab Reda on 7/24/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import HCMapInfoView
import CoreLocation

class HotelMapDetailsView: HCAnnotation {
    
    var hotelName:String {
        get {
            return title ?? "No name"
        }
        set {
            title = newValue
        }
    }
    
    var hotelLocation:String {
        get {
            return subtitle ?? "No Location"
        }
        set {
            subtitle = newValue
        }
    }
    
    convenience init(hotelName:String, hotelLocation:String, coordinate:CLLocationCoordinate2D)
    {
        self.init(title: hotelName, subtitle: hotelLocation, coordinate: coordinate)
       
        self.hotelName = hotelName
        self.hotelLocation  = hotelLocation
    }
}
