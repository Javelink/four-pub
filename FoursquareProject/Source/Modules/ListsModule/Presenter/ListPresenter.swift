//
//  ListPresenter.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/2/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

final class ListPresenter {

    func listViewState(at index: Int) -> CellForCollectionViewsState {
        let state = CellForCollectionViewsState(title: ListViewEnum.listsVCObjects[index].title,
                                                image: ListViewEnum.listsVCObjects[index].image,
                                                description: ListViewEnum.listsVCObjects[index].description)
        return state
    }

    func listsVCObjectsCount() -> Int {
        return ListViewEnum.listsVCObjects.count
    }

    func searchCellState(at index: Int) -> SearchControllerState {
        let state = SearchControllerState(title: SearchControllerEnum.searchListsObjects[index].title,
                                          image: SearchControllerEnum.searchListsObjects[index].image)
        return state
    }

    func searchListsObjectsCount() -> Int {
        return SearchControllerEnum.searchListsObjects.count
    }
}
