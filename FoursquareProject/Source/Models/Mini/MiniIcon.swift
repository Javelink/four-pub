//
//  MiniIcon.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/10/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct MiniIcon: Codable {
    let iconPrefix: String
    let suffix: Suffix

    enum CodingKeys: String, CodingKey {
        case iconPrefix = "prefix"
        case suffix
    }
}
