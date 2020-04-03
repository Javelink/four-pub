//
//  HereNowGroup.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct HereNowGroup: Codable {
    let type: String?
    let count: Int?
    let items: [PurpleItem]?
    let name: String?
}
