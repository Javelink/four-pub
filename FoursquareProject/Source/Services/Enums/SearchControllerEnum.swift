//
//  SearchControllerEnum.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/10/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation
import UIKit

enum SearchControllerEnum {
    case breakfast
    case lunch
    case dinner
    case coffeAndTea
    case night
    case work
    case movie
    case park
    case gallery
    case museum

    static let searchControllerObjects = [breakfast, lunch, dinner, coffeAndTea, night, work]
    static let searchListsObjects = [movie, park, gallery, museum]
}

extension SearchControllerEnum {

    var title: String {
        switch self {
        case .breakfast:
            return "Breakfast"
        case .lunch:
            return "Lunch"
        case .dinner:
            return "Dinner"
        case .coffeAndTea:
            return "Coffe and Tea"
        case .night:
            return "Night"
        case .work:
            return "Work"
        case .movie:
            return "Movie"
        case .park:
            return "Park"
        case .gallery:
            return "Gallery"
        case .museum:
            return "Museum"
        }
    }

    var image: UIImage {
        switch self {
        case .breakfast:
            return UIImage(named: "breakfast")!
        case .lunch:
            return UIImage(named: "lunch")!
        case .dinner:
            return UIImage(named: "dinner")!
        case .coffeAndTea:
            return UIImage(named: "coffeAndTea")!
        case .night:
            return UIImage(named: "night")!
        case .work:
            return UIImage(named: "work")!
        case .movie:
            return UIImage(named: "movie")!
        case .park:
            return UIImage(named: "park")!
        case .gallery:
            return UIImage(named: "museum")!
        case .museum:
            return UIImage(named: "art-gallery")!
        }
    }
}
