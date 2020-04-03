//
//  CoordinatorProtocol.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 7/12/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

protocol CoordinatorProtocol: class {
    func routeToMaps(_ address: String?)
    func routeToInformation(_ stringId: String)
    func routeToSearch(_ theme: String)
    func routeToList(_ index: Int)
}
