//
//  Geocode.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct Geocode: Codable {
    let what, geocodeWhere: String?
    let feature: Feature?
    let parents: [JSONAny]?
    let center: Center?
    let displayString: String?
    let ccc: Ccc?
    let geometry: Geometry?
    let slug, longID: String?
    
    enum CodingKeys: String, CodingKey {
        case what
        case geocodeWhere = "where"
        case feature, parents
        case center, displayString, ccc, geometry, slug
        case longID = "longId"
    }
}

enum Ccc: String, Codable {
    case aus = "AU"
    case usa = "US"
    case uk = "UK"
    case za = "ZA"
}
