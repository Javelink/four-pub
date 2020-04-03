//
//  Venue.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct Venue: Codable {
    let id, name: String?
    let location: Location?
    let categories: [Category]?
    let hasPerk: Bool?

    enum CodingKeys: String, CodingKey {
        case id, name, location, categories
        case hasPerk
    }
}
