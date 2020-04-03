//
//  StringForUrl.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/10/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

private let intent = "browse"

enum RequestStrings {
    case searchString(_ currentCity: String, query: String, radius: String)
    case recomendedString(_ cityName: String)
    case suggestString(_ currentCity: String, dataString: String, query: String)
    case informationString
    case emptyComponent
}

extension RequestStrings {
    
    var string: String {
        switch self {
        case .searchString(let currentCity, let query, let radius):
            return "near=\(currentCity)&intent=\(intent)&radius=\(radius)&query=\(query)&"
        case .recomendedString(let cityName):
            return "near=\(cityName)&"
        case .suggestString(let currentCity, let dataString, let query):
            return "near=\(currentCity)&startAt=\(dataString)&query=\(query)&"
        case .informationString:
            return "&"
        case .emptyComponent:
            return ""
        }
    }
}
