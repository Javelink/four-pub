//
//  PurplePhoto.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct PurplePhoto: Codable {
    let photoPrefix: String
    let suffix: String
    let photoDefault: Bool
    
    enum CodingKeys: String, CodingKey {
        case photoPrefix = "prefix"
        case suffix
        case photoDefault = "default"
    }
}
