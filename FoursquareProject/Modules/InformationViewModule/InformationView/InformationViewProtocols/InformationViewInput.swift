//
//  InformationViewInput.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/28/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

protocol InformationViewInput: class {
    func venueDataSetup(_ model: DetailState)
    func openURLlink(_ url: URL)
}
