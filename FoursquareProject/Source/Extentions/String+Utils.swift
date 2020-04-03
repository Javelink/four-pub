//
//  String+Utils.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/25/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

extension String {

    func replace(string: String, replacement: String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }

    func removeWhitespace() -> String {
        return self.replace(string: " ", replacement: "")
    }
}
