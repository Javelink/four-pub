//
//  PurpleItem.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct PurpleItem: Codable {
    let identifier: String?
    let firstName, lastName, gender: String?
    let photo: IconClass?
    let createdAt: Int?
    let source: Source?
    let itemPrefix: String?
    let suffix: String?
    let width, height: Int?
    let user: BestPhotoUser?
    let visibility: String?
    
    enum CodingKeys: String, CodingKey {
        case identifier, firstName, lastName, gender, photo, createdAt, source
        case itemPrefix = "prefix"
        case suffix, width, height, user, visibility
    }
}
