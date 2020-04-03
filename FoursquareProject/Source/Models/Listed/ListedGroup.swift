//
//  ListedGroup.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct ListedGroup: Codable {
    let type, name: String?
    let count: Int?
    let items: [FluffyItem]?
}
