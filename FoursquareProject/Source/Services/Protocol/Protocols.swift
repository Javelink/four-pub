//
//  Protocols.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 3/26/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

protocol ReloadDataDelegate: class {
    func reloadData()
}

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
    var staticParameters: String { get }
}
