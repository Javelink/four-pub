//
//  Menu.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct Menu: Codable {
    let type, label, anchor: String
    let url, mobileURL: String
    
    enum CodingKeys: String, CodingKey {
        case type, label, anchor, url
        case mobileURL = "mobileUrl"
    }
}
