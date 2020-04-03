//
//  RecomendedInteractor.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/21/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

class RecomendedInteractor {
    weak var output: RecomendedInteractorOutput?
}

extension RecomendedInteractor: RecomendedInteractorInput {

    func fetchRecomendation() {

        let currentCity = locationManager.cityName

        APIClient.fetchResponce(VenuesEndpoint.explore,
                                component: RequestStrings.recomendedString(currentCity)) { [weak self] (model: Employees) in

            guard let strongSelf = self, let groups = model.response.groups else { return }

            strongSelf.mappingRecomendedVanues(groups)
        }
    }
}

extension RecomendedInteractor {

    private func mappingRecomendedVanues(_ groups: [Group]) {

        for venue in groups {

            guard let items = venue.items else { return }

            mappingInformationForVanues(items)
        }

        output?.interactorDidReloadData()
    }

    private func mappingInformationForVanues(_ items: [GroupItem]) {

        for item in items {

            guard let categories = item.venue?.categories,
                  let identifier = item.venue?.id,
                  let name = item.venue?.name else {
                return
            }

            mappingImageAndSetupCellRecomendation(categories, identifier: identifier, name: name)
        }
    }

    private func mappingImageAndSetupCellRecomendation(_ categories: [Category], identifier: String, name: String) {

        for categorie in categories {

            guard let urlImage = URL(string: categorie.icon.iconPrefix + "88" + categorie.icon.suffix),
                  let data = try? Data(contentsOf: urlImage),
                  let pluralName = categorie.pluralName else {
                return
            }

            output?.interactorDidSetupCellForTableViewsStates(identifier: identifier,
                                                              data: data,
                                                              name: name,
                                                              pluralName: pluralName)
        }
    }
}
