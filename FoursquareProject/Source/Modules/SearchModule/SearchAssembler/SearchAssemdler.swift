//
//  SearchAssemdler.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/16/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation
import UIKit

protocol SearchAssemdlerInputProtocol {
    static func createSearchModule(query: String) -> UIViewController
}

class SearchAssemdler: SearchAssemdlerInputProtocol {

    static func createSearchModule(query: String) -> UIViewController {
        let navController = SearchViewController.loadFromStoryboard("SearchVC")
        let presenter = SearchPresenter(query: query)
        let interactor = SearchInteractor()
        let router = SearchRouter()

        navController.output = presenter
        presenter.view = navController
        presenter.router = router
        presenter.interactor = interactor
        interactor.output = presenter

        return navController
    }
}
