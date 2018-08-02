//
//  TulipFonts.swift
//  TULIP
//
//  Created by Manar Magdy on 23/01/2018.
//  Copyright © 2018 Manar Magdy. All rights reserved.
//

import UIKit


public extension UIFont {
    
    private static let regularFontName = "DINNextLTArabic-Regular"
    
    private static let boldFontName = "DINNextLTArabic-Bold"
    
    
    
    
    /**
     This method provides regular Joygn font.
     
     - parameter fontSize: requested font size
     
     - returns: Customized Joygn regular UIFont object
     
     */
    public static func tulipRegularFont(fontSize: CGFloat) -> UIFont? {
        
        let result = UIFont.init(name: regularFontName, size: fontSize)
        return result
    }
    
    
    /**
     This method provides bold Joygn font.
     
     - parameter fontSize: requested font size
     
     - returns: Customized Joygn bold UIFont object
     
     */
    public static func tulipBoldFont(fontSize: CGFloat) -> UIFont? {
        
        let result = UIFont.init(name: boldFontName, size: fontSize)
        return result
    }
    
    
}
