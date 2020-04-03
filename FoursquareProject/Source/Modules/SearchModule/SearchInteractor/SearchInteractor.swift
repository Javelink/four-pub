//
//  SearchInteractor.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/16/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

class SearchInteractor {
    weak var output: SearchInteractorOutputProtocol?
}

extension SearchInteractor: SearchInteractorInputProtocol {

    func changedVelue(query: String?) {

        guard let query = query else {
            return
        }

        output?.interactorDidChangeValue(query: query)
    }

    func reloadedData() {
        DispatchQueue.main.async { [weak self] in

            guard let strongSelf = self else {
                return
            }

            strongSelf.output?.interactorDidReloadData()
        }
    }

    func defaultValueChooseTF() {
        output?.interactorDidDefaultValueChooseTF("1000")
    }

    func fetchedVenues(_ querys: String, radius: String) {
        venues(querys: querys, radius: radius)
    }

    func didIsEditedTF(_ textFieldText: String?, string: String, isEdit: Bool) -> Bool {

        guard let radiusText = textFieldText else {
            return false
        }

        let length = !string.isEmpty ? radiusText.count + 1 : radiusText.count - 1

        if isEdit {
            return length > 5 || length < 1 ? false : true
        }

        return length > 15 ? false : true
    }

    func checkedTF(_ enterTFtext: String, chooseRadiusTFtext: String) -> Bool {

        if enterTFtext == "" || chooseRadiusTFtext == "" {
            return false
        }

        return true
    }
}

private extension SearchInteractor {

    private func venues(querys: String, radius: String) {

        let currentCity = locationManager.cityName

        print(currentCity)

        APIClient.fetchResponce(VenuesEndpoint.search,
                                component: RequestStrings.searchString(currentCity,
                                                                       query: querys,
                                                                       radius: radius)) { [weak self] (model: Employees) in

            guard let venues = model.response.venues, let strongSelf = self else {
                return
            }

            for venue in venues {
                strongSelf.setupSearchCellStatesData(venue.categories, identifier: venue.id, name: venue.name)
            }

            strongSelf.reloadedData()
        }
    }

    private func setupSearchCellStatesData(_ categories: [Category]?, identifier: String?, name: String?) {

        guard let categories = categories else {
            return
        }

        for categorie in categories {

            guard let identifier = identifier,
                  let name = name,
                  let pluralName = categorie.pluralName,
                  let urlImage = URL(string: categorie.icon.iconPrefix + "88" + categorie.icon.suffix),
                  let data = try? Data(contentsOf: urlImage) else {
                return
            }

            output?.interactorDidSetupCellForTableViewsStates(identifier, data: data, name: name, pluralName: pluralName)
        }
    }
}
