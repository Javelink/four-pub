//
//  BestPhoto.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct BestPhoto: Codable {
    let identifier: String?
    let createdAt: Int?
    let source: Source?
    let bestPhotoPrefix: String
    let suffix: String
    let width, height: Int?
    let visibility: String?
    let user: BestPhotoUser?
    
    enum CodingKeys: String, CodingKey {
        case identifier, createdAt, source
        case bestPhotoPrefix = "prefix"
        case suffix, width, height, visibility, user
    }
}
