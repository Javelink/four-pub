//
//  InformationAssembly.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/28/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation
import UIKit

protocol InformationAssemblyInput {
    static func createInformationModule(_ identifier: String) -> UIViewController
}

class InformationAssembly: InformationAssemblyInput {

    static func createInformationModule(_ identifier: String) -> UIViewController {
        let controller = InformationViewController.loadFromStoryboard("InformationVC")
        let presenter = InformationPresenter(identifier: identifier)
        let interactor = InformationInteractor()
        let router = InformationRouter()

        controller.output = presenter
        presenter.view = controller
        presenter.router = router
        presenter.interactor = interactor
        interactor.output = presenter

        return controller
    }
}
