//
//  InformationViewOutput.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/28/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

protocol InformationViewOutput {
    func loadView()
    func viewLink(_ text: String?)
}
