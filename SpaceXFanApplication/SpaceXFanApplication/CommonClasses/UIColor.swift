
//
//  UIColor.swift
//  SpaceXFanApplication
//
//  Created by Vestel on 24/09/22.
//

import UIKit

//extension UIColor {
//    convenience init(hexFromString:String, alpha:CGFloat = 1.0) {
//        var cString:String = hexFromString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
//        var rgbValue:UInt32 = 10066329 //color #999999 if string has wrong format
//
//        if (cString.hasPrefix("#")) {
//            cString.remove(at: cString.startIndex)
//        }
//        
//        if ((cString.count) == 6) {
//            Scanner(string: cString).scanHexInt32(&rgbValue)
//        }
//
//        self.init(
//            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
//            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
//            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
//            alpha: alpha
//        )
//    }
//}



extension UIColor
    {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
       
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
            
        }
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
        
        
    }
}
