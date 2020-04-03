//
//  MapsAssembly.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/28/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation
import UIKit

protocol MapsAssemblyInput {
    static func createMapsModule(location: String?) -> UIViewController
}

class MapsAssembly: MapsAssemblyInput {

    static func createMapsModule(location: String?) -> UIViewController {

        guard let string = location else {
            return UIViewController()
        }

        let controller = MapViewController.loadFromStoryboard(.map)
        let presenter = MapsPresenter(location: string)
        let interactor = MapsInteractor()
        let router = MapsRouter()

        controller.output = presenter
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        interactor.output = presenter

        return controller
    }
}
