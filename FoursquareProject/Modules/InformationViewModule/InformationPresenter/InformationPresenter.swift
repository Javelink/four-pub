//
//  InformationPresenter.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/1/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

final class InformationPresenter {

    weak var view: InformationViewInput?
    var interactor: InformationInteractorInput?
    var router: InformationRouterInput?
    private var identifier: String?
    
    init(identifier: String) {
        self.identifier = identifier
    }
}

extension InformationPresenter: InformationViewOutput {
    func viewSocialNetwork(_ url: String, text: String?) {
        interactor?.openedSocialLink(url, text: text)
    }

    func viewLink(_ text: String?) {
        interactor?.openedLink(text)
    }

    func loadView() {
        interactor?.fetchedInfomationForVenues(identifier: identifier)
    }
}

extension InformationPresenter: InformationInteractorOutput {
    func interactorDidFetch(_ model: DetailState) {
        view?.venueDataSetup(model)
    }

    func interactorDidLink(_ url: URL) {
        view?.openURLlink(url)
    }
}
