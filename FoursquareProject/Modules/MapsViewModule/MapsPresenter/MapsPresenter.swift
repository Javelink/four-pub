//
//  MapsPresenter.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/28/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

class MapsPresenter {
    weak var view: MapsViewInput?
    var interactor: MapsInteractorInput?
    var router: MapsRouterInput?
    private var location: String?

    init(location: String) {
        self.location = location
    }
}

extension MapsPresenter: MapsViewOutput {

    func viewDidAppear() {
        interactor?.findedLocation(location)
    }
}

extension MapsPresenter: MapsInteractorOutput {
    func interactorDidLocation(_ location: String) {
        view?.localSearch(location)
    }
}
