//
//  HomePresenter.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/26/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

final class HomePresenter: HomeControllerDataSourceProtocol {

    func searchCellState(at index: Int) -> SearchControllerState {
        let state = SearchControllerState(title: SearchControllerEnum.searchControllerObjects[index].title,
                                          image: SearchControllerEnum.searchControllerObjects[index].image)

        return state
    }

    func searchControllerObjectsCount() -> Int {
        return SearchControllerEnum.searchControllerObjects.count
    }
}
