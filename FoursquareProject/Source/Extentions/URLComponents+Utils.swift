//
//  URLComponents+Utils.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/24/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

extension URLComponents {

    mutating func setQueryItems(with parameters: [String: String]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
    }
}
