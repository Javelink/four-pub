//
//  Meta.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct Meta: Codable {
    let code: Int?
    let requestID: String?
    
    enum CodingKeys: String, CodingKey {
        case code
        case requestID = "requestId"
    }
}
