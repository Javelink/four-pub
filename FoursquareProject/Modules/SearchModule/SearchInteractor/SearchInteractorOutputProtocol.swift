//
//  SearchInteractorOutputProtocol.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/16/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

protocol SearchInteractorOutputProtocol: class {
    func interactorDidDefaultValueChooseTF(_ value: String)
    func interactorDidReloadData()
    func interactorDidChangeValue(query: String)
    func interactorDidSetupCellForTableViewsStates(_ identifier: String, data: Data, name: String, pluralName: String)
    func interactorStop()
}
