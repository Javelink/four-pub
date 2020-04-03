//
//  SearchRouter.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/16/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation
import UIKit

class SearchRouter: SearchRouterInputProtocol {

    weak var searchVC: SearchViewController?

    func showInformation(_ stringId: String) {
        searchVC?.push(InformationAssembly.createInformationModule(stringId))
    }
}
