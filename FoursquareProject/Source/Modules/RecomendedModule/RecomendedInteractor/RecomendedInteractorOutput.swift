//
//  RecomendedInteractorOutput.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/21/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

protocol RecomendedInteractorOutput: class {
    func interactorDidSetupCellForTableViewsStates(identifier: String, data: Data, name: String, pluralName: String)
    func interactorDidReloadData()
}
