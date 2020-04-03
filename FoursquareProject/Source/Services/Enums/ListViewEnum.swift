//
//  ListsVCEnum.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/10/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation
import UIKit

enum ListViewEnum {
    case recomended
    case miniVenue

    static let listsVCObjects = [recomended, miniVenue]
}

extension ListViewEnum {

    var title: String {
        switch self {
        case .recomended:
            return "Recomended"
        case .miniVenue:
            return "Mini Venue"
        }
    }

    var image: UIImage {
        switch self {
        case .recomended:
            return UIImage(named: "city-transparent")!
        case .miniVenue:
            return UIImage(named: "city-skyline")!
        }
    }

    var description: String {
        switch self {
        case .recomended:
            return "list of recommended venues near the current location"
        case .miniVenue:
            return "list of mini-venues partially matching the search term, near the location"
        }
    }

    var pushOnVC: UIViewController {
        switch self {
        case .recomended:
            return RecomendedAssemblerImp.createRecomendedModule()
        case .miniVenue:
            return MiniPlaceVC.loadFromStoryboard("MiniPlaceVC")
        }
    }
}
