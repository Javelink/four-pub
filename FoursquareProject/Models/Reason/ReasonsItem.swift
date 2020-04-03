//
//  ReasonsItem.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct ReasonsItem: Codable {
    let summary: Summary?
    let type: TypeEnum?
    let reasonName: ReasonName?
}

enum ReasonName: String, Codable {
    case globalInteractionReason
}

enum Summary: String, Codable {
    case thisSpotIsPopular = "This spot is popular"
}

enum TypeEnum: String, Codable {
    case general
}
