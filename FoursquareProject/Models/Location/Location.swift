//
//  Location.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct Location: Codable {
    let address, crossStreet: String?
    let lat, lng: Double?
    let labeledLatLngs: [LabeledLatLng]?
    let postalCode: String?
    let city: String?
    let state: String?
    let country: String?
    let formattedAddress: [String]?
    let neighborhood: String?
}

enum Country: String, Codable {
    case usa = "US"
    case unitedStates = "United States"
    case australia = "Australia"
    case ukraine = "Ukraine"
    case iNingizimuAfrika = "iNingizimu Afrika"
}

enum State: String, Codable {
    case california = "CA"
    case californ = "California"
    case calif = "Calif"
    case nsw = "NSW"
    case vic = "VIC"
    case newy = "NY"
}
