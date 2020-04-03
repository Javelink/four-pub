//
//  Category.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct Category: Codable {
    let id, name, pluralName, shortName: String?
    let icon: Icon
    let primary: Bool?
}
