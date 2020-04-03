//
//  UILabel+Utils.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/13/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func numberOfLines() {
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
    }
}
