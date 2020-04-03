//
//  Contact.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct Contact: Codable {
    let phone, formattedPhone, twitter, facebook: String?
    let facebookUsername, facebookName: String?
}
