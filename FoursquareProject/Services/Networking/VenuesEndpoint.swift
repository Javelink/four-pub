//
//  Url.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/10/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

//VGE3JTRPAAFJZUDRYOM0HTUH32ULJCCHPN3YHLTVLYOMCCIV
//QPW13YICEG3R4V5M2A4A05DYMDAGS011NX32YSNMEOGH3AOS

import Foundation

private let clientId = "VGE3JTRPAAFJZUDRYOM0HTUH32ULJCCHPN3YHLTVLYOMCCIV"//"SBZYK2AUP1RVMZIASG5MVMCBOP5L3T3LQ5MTY2PGJ313WNLB"
private let clientSecret = "QPW13YICEG3R4V5M2A4A05DYMDAGS011NX32YSNMEOGH3AOS"//"CCEA2U23MZV50TEB1G2WPG5ZNBLCTGOBTBG11XMAPXZMVBBN"
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
