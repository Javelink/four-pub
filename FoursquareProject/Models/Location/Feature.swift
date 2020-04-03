//
//  Feature.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct Feature: Codable {
    let name: Name?
    let displayName, matchedName, highlightedName: String?
    let woeType: Int?
    let slug, identifier, longID: String?
    let geometry: Geometry?
    
    enum CodingKeys: String, CodingKey {
        case name, displayName, matchedName, highlightedName, woeType, slug, identifier
        case longID = "longId"
        case geometry
    }
}

enum Name: String, Codable {
    case sanFrancisco = "San Francisco"
    case vic = "VIC"
    case newYork = "New York"
    case kha = "Kharkiv"
    case kharkivskaOblast = "Kharkivs’ka Oblast’"
    case london = "London"
    case johannesburg = "Johannesburg"
}
