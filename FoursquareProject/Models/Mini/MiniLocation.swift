//
//  MiniLocation.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/10/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct MiniLocation: Codable {
    let address: String?
    let state: State?
    let country: Country
    let lat, lng: Double
    let crossStreet, postalCode: String?
}
