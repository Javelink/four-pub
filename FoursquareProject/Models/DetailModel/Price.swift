//
//  Price.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/25/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct Price: Codable {
    let tier: Int
    let message, currency: String
}
