//
//  Response.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct Response: Codable {
    let venues: [Venue]?
    let suggestedFilters: SuggestedFilters?
    let geocode: Geocode?
    let headerLocation, headerFullLocation, headerLocationGranularity: String?
    let totalResults: Int?
    let suggestedBounds: Bounds?
    let venue: DetailVenue?
    let minivenues: [Minivenue]?
    let groups: [Group]?
}

struct SuggestedFilters: Codable {
    let header: String?
    let filters: [Filter]?
}

struct Filter: Codable {
    let name, key: String?
}
