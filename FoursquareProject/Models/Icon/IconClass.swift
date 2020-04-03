//
//  IconClass.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct IconClass: Codable {
    let photoPrefix: String
    let suffix: String
    
    enum CodingKeys: String, CodingKey {
        case photoPrefix = "prefix"
        case suffix
    }
}
