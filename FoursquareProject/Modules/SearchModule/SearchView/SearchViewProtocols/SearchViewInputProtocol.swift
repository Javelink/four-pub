//
//  SearchViewInputProtocol.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/16/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

protocol SearchViewInputProtocol: class {
    func showDefaultValueChooseTF(_ value: String)
    func reloadData()
    func showChangeValue(query: String)
    func isEmptyTextField() -> Bool?
    func stop()
}
