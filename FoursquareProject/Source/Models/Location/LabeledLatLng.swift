//
//  LabeledLatLng.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct LabeledLatLng: Codable {
    let label: String?
    let lat, lng: Double
}
