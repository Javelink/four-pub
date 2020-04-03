//
//  UIColor+Utils.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/26/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    func colorWithHexString(_ hexString: String, alpha: CGFloat = 1.0) -> UIColor {
        let hexint = Int(intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }

    private func intFromHexString(hexStr: String) -> UInt64 {
        var hexInt: UInt64 = 0
        let scanner: Scanner = Scanner(string: hexStr)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        scanner.scanHexInt64(&hexInt)
        return hexInt
    }
}
