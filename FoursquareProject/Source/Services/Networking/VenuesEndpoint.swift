//
//  Url.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/10/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

private let clientId = "KTGQ32WIN1WNGCNPECFDLYCQRG4DWZI2V5PEDMOKYSUHGL4L"
private let clientSecret = "G2UJ15ZXBO1UBX0D1E5A0JBGQGUELWDAWYXPRIHB115NFTYV"
private let date = "20190320"

enum VenuesEndpoint {
    case search
    case explore
    case suggest
    case identifier(_ identifier: String)
}

extension VenuesEndpoint: EndpointType {
    
    var baseURL: URL {
        return URL(string: "https://api.foursquare.com/v2/venues/")!
    }
    
    var path: String {
        switch self {
        case .search:
            return "search"
        case .explore:
            return "explore"
        case .suggest:
            return "suggestcompletion"
        case .identifier(let identifier):
            return "\(identifier)"
        }
    }
    
    var staticParameters: String {
        return "client_id=\(clientId)&client_secret=\(clientSecret)&v=\(date)"
    }
}
