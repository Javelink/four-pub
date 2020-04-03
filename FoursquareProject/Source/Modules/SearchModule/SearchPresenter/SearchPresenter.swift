//
//  Presenter.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 3/21/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

class SearchPresenter {
    
    weak var view: SearchViewInputProtocol?
    var interactor: SearchInteractorInputProtocol?
    var router: SearchRouterInputProtocol?
    private var query: String?
    private var cellForTableViewsStates = [CellForTableViewsState]()

    init(query: String) {
        self.query = query
    }
}

// MARK: - SearchViewOutputProtocol
extension SearchPresenter: SearchViewOutputProtocol {

    func viewWillAppear() {
        interactor?.changedVelue(query: query)
    }

    func viewDidLoad() {
        interactor?.defaultValueChooseTF()
    }

    func viewOnTextfieldValueChange(_ queryString: String?, radius: String?) {

        guard let queryS = queryString, let radiuS = radius else {
            return
        }

        interactor?.fetchedVenues(queryS, radius: radiuS)
    }

    func viewIsEditTF(_ textFieldText: String?, string: String, isEdit: Bool) -> Bool {

        guard let edit = interactor?.didIsEditedTF(textFieldText, string: string, isEdit: isEdit) else {
            return false
        }

        return edit
    }

    func viewIsEmptyTextFields(_ enterTFtext: String?, chooseRadiusTFtext: String?) -> Bool {

        guard let stringETF = enterTFtext,
              let stringCRTF = chooseRadiusTFtext,
              let checked = interactor?.checkedTF(stringETF, chooseRadiusTFtext: stringCRTF) else {
            return false
        }

        return checked
    }
}

// MARK: - SearchInteractorOutputProtocol
extension SearchPresenter: SearchInteractorOutputProtocol {

    func interactorDidChangeValue(query: String) {
        view?.showChangeValue(query: query)
    }

    func interactorDidReloadData() {
        view?.reloadData()
    }

    func interactorDidDefaultValueChooseTF(_ value: String) {
        view?.showDefaultValueChooseTF(value)
    }

    func interactorDidSetupCellForTableViewsStates(_ identifier: String, data: Data, name: String, pluralName: String) {
        cellForTableViewsStates.append(createCellForTableViewsState(identifier, data: data, name: name, pluralName: pluralName))
    }
}

// MARK: - SearchDatasourceProtocol
extension SearchPresenter: SearchDatasourceProtocol {

    func cellForTableViewsStatesCount() -> Int {
        return cellForTableViewsStates.count
    }

    func cellForTableViewsState(at index: Int) -> CellForTableViewsState {

        let identifier = cellForTableViewsStates[index].identifier
        let name = cellForTableViewsStates[index].name
        let pluralName = cellForTableViewsStates[index].pluralName
        let data = cellForTableViewsStates[index].data

        return createCellForTableViewsState(identifier, data: data, name: name, pluralName: pluralName)
    }

    func searchCellStatesClean() {
        cellForTableViewsStates = []
    }

    func isEmptyTF() -> Bool {
        return view?.isEmptyTextField() ?? false
    }
}

// MARK: - Methods
private extension SearchPresenter {
    private func createCellForTableViewsState(_ identifier: String, data: Data, name: String, pluralName: String) -> CellForTableViewsState {
        return CellForTableViewsState(identifier: identifier, data: data, name: name, pluralName: pluralName)
    }
}
