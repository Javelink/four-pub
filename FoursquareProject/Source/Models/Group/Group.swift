//
//  Group.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct Group: Codable {
    let type, name: String?
    let items: [GroupItem]?
}

struct GroupItem: Codable {
    let reasons: Reasons?
    let venue: GroupVenue?
    let referralID: String?
    
    enum CodingKeys: String, CodingKey {
        case reasons, venue
        case referralID = "referralId"
    }
}

struct GroupVenue: Codable {
    let id, name: String?
    let location: Location?
    let categories: [Category]?
    let photos: Photos?
    let rating: Double?
}

struct Photos: Codable {
    let count: Int
    let groups: [JSONAny]
}
