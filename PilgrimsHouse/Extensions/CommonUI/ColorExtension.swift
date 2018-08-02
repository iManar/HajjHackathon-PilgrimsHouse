//
//  TulipColors.swift
//  TULIP
//
//  Created by Manar Magdy on 23/01/2018.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import UIKit


public extension UIColor {
    
    // MARK: - Properties
    
    // MARK: - Private Instance Computed Variables
    
    /**
     *  Contains joygn primary green colour
     */
    public static var Primary : UIColor {
        get {
            return UIColor(hex: 0x2aaa82)
        }
    }
    
    /**
     *  Contains joygn secondary green colour
     */
    public static var TulipSecondaryGreen : UIColor {
        get {
            return UIColor(hex:0x0083ca)
        }
    }
    
    /**
     *  Contains joygn primary gray colour
     */
    public static var TulipPrimaryGray : UIColor {
        get {
            return UIColor(hex:0xAAAAAA)
        }
    }
    public static var badgeOrange: UIColor{
        return UIColor(hex:0xff7a00 )
    }
    
    /**
     *  Contains text fields border color
     */
    public static var TulipTextFieldBorderColor : UIColor {
        get {
            return UIColor(hex: 0xcccccc).withAlphaComponent(0.4)
        }
    }
    
    
    
    // MARK: - Methods
    
    /**
     Initializes UIColor for given hex value.
     */
    public convenience init(hex: UInt32) {
        let value = hex & 0xffffff
        let red = (CGFloat)((value >> 16) & 0xff)/255.0
        let green = (CGFloat)((value >> 8) & 0xff)/255.0
        let blue = (CGFloat)(value & 0xff)/255.0
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
}
