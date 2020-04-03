//
//  SecondPresenter.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/1/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

final class RecomendedPresenter {
    
    // MARK: - Property
    weak var view: RecomendedViewInput?
    var interactor: RecomendedInteractorInput?
    var router: RecomendedRouterInput?
    private var cellForTableViews = [CellForTableViewsState]()
}

extension RecomendedPresenter: RecomendedViewOutput {

    func viewDidAppear() {
        interactor?.fetchRecomendation()
    }
}

extension RecomendedPresenter: RecomendedInteractorOutput {

    func interactorDidReloadData() {
        view?.reloadData()
    }

    func interactorDidSetupCellForTableViewsStates(identifier: String, data: Data, name: String, pluralName: String) {
        let cellForTableViewsObject = CellForTableViewsState(identifier: identifier, data: data, name: name, pluralName: pluralName)
        cellForTableViews.append(cellForTableViewsObject)
    }
}

extension RecomendedPresenter: RecomendedDatasourceProtocol {

    func cellForTableViewsState(at index: Int) -> CellForTableViewsState {
        let identifier = cellForTableViews[index].identifier
        let name = cellForTableViews[index].name
        let pluralName = cellForTableViews[index].pluralName
        let data = cellForTableViews[index].data
        let state = CellForTableViewsState(identifier: identifier, data: data, name: name, pluralName: pluralName)

        return state
    }

    func cellForTableViewsStatesCount() -> Int {
        return cellForTableViews.count
    }
}
