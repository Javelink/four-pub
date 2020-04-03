//
//  Minivenue.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/4/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct Minivenue: Codable {
    let id, name: String?
    let location: MiniLocation?
    let categories: [MiniCategory]?
    let hasPerk: Bool?
}
