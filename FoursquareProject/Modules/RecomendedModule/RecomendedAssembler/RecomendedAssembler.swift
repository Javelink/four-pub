//
//  RecomendedAssembler.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/21/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation
import UIKit

protocol RecomendedAssembler {
    static func createRecomendedModule() -> UIViewController
}

class RecomendedAssemblerImp: RecomendedAssembler {

    static func createRecomendedModule() -> UIViewController {
        let navController = RecomendedViewController.loadFromStoryboard(.recomended)
        let presenter = RecomendedPresenter()
        let interactor = RecomendedInteractor()
        let router = RecomendedRouter()

        navController.output = presenter
        presenter.view = navController
        presenter.router = router
        presenter.interactor = interactor
        interactor.output = presenter

        return navController
    }
}
