//
//  BeenHere.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct BeenHere: Codable {
    let count, lastCheckinExpiredAt: Int
    let marked: Bool
    let unconfirmedCount: Int
}
