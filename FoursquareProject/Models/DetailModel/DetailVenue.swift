//
//  DetailVenue.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/3/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct DetailVenue: Codable {
    let identifier, name: String?
    let contact: Contact?
    let location: Location?
    let canonicalURL: String?
    let categories: [Category]?
    let verified: Bool?
    let url: String?
    let stats: Stats?
    let likes: Likes?
    let dislike, okey, allowMenuURLEdit: Bool?
    let beenHere: BeenHere?
    let specials: Inbox?
    let photos: HereNow?
    let reasons: Inbox?
    let hereNow: HereNow?
    let createdAt: Int?
    let tips: Likes?
    let shortURL: String?
    let timeZone: String?
    let listed: Likes?
    let pageUpdates, inbox: Inbox?
    let attributes: Attributes?
    let price: Price?
    let rating: Double?
    let ratingColor: String?
    let ratingSignals: Int?
    
    enum CodingKeys: String, CodingKey {
        case identifier, name, contact, location
        case canonicalURL = "canonicalUrl"
        case categories, verified, stats, likes, dislike, okey, url
        case allowMenuURLEdit = "allowMenuUrlEdit"
        case beenHere, specials, photos, reasons, hereNow, createdAt, tips
        case shortURL = "shortUrl"
        case timeZone, listed, pageUpdates, inbox, attributes, rating, price, ratingColor, ratingSignals
    }
}
