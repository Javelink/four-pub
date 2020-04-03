//
//  Icon.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct Icon: Codable {
    let iconPrefix: String
    let suffix: String
    
    enum CodingKeys: String, CodingKey {
        case iconPrefix = "prefix"
        case suffix
    }
}

enum Suffix: String, Codable {
    case png = ".png"
}
