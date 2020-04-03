//
//  HighlightTColor.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct HighlightTColor: Codable {
    let photoID: String?
    let value: Int?

    enum CodingKeys: String, CodingKey {
        case photoID = "photoId"
        case value
    }
}
