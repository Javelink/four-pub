//
//  FluffyItem.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct FluffyItem: Codable {
    let identifier, name, description, type: String?
    let user: PurpleUser?
    let editable, itemPublic, collaborative: Bool?
    let url: String?
    let canonicalURL: String?
    let createdAt, updatedAt: Int?
    let followers: Followers?
    let listItems: Inbox?
    
    enum CodingKeys: String, CodingKey {
        case identifier, name, description, type, user, editable
        case itemPublic = "public"
        case collaborative, url
        case canonicalURL = "canonicalUrl"
        case createdAt, updatedAt, followers, listItems
    }
}
