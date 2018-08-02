//
//  MapInfoHotelView.swift
//  JazHotels
//
//  Created by Zeinab Reda on 7/24/18.
//  Copyright © 2018 Jaz. All rights reserved.
//

import UIKit
import HCMapInfoView

class MapInfoHotelView: HCMapInfoView {

    @IBOutlet weak var hotelImg: UIImageView!
    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var travelTimeLabel: UILabel!
    
    func update(withAnnotation annotation:HCAnnotation)
    {
        self.hotelName.text = annotation.title
        self.location.text = annotation.subtitle
    }
    
    
    func update(withHotel hotel:HotelMapDetailsView)
    {
        self.update(withAnnotation: hotel)
        self.hotelName.text = hotel.hotelName
        self.hotelImg.image = hotel.image
        self.location.text = hotel.hotelLocation
    }

}
