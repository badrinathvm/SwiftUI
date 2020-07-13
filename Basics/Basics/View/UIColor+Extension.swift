//
//  UIColor+Extension.swift
//  Basics
//
//  Created by Venkatnarayansetty, Badarinath on 7/12/20.
//  Copyright © 2020 Badarinath Venkatnarayansetty. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func fromHexString(_ hexString: String, alpha: CGFloat = 1.0) -> UIColor {
        let red, green , blue: CGFloat
        let offset = hexString.hasPrefix("#") ? 1: 0
        let start = hexString.index(hexString.startIndex, offsetBy: offset)
        let hexColor = String(hexString[start...])
        let scanner = Scanner(string: hexColor)
        var hexNumber:UInt64 = 0
        if scanner.scanHexInt64(&hexNumber) {
            red = CGFloat((hexNumber & 0xff0000) >> 16) / 255
            green = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
            blue = CGFloat(hexNumber & 0x0000ff) / 255
            return UIColor(red: red, green: green, blue: blue, alpha: alpha)
        } else {
            return UIColor(red: 0, green: 0, blue: 0, alpha: alpha)
        }
    }
}
