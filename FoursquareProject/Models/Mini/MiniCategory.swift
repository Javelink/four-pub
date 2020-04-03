//
//  MiniCategory.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/10/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct MiniCategory: Codable {
    let identifier, name, pluralName, shortName: String?
    let icon: MiniIcon
    let primary: Bool?
}
