//
//  UIButton+Utils.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/8/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {

    func addShadowAndCorner() {
        layer.cornerRadius = 8
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowRadius = 4
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
    }
}
