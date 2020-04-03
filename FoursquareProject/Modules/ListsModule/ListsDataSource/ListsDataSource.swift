//
//  ListsDataSource.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/28/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation
import UIKit

class ListsDataSource: NSObject {
    private var collectionViewTop: UICollectionView!
    private var collectionViewBottom: UICollectionView!
    private let identifier = "identifier"
    private var presenter = ListPresenter()

    init(collectionViewTop: UICollectionView, collectionViewBottom: UICollectionView) {
        super.init()
        self.collectionViewTop = collectionViewTop
        self.collectionViewBottom = collectionViewBottom
        self.register(collectionViewTop, collectionViewBottom: collectionViewBottom)
    }
}

extension ListsDataSource: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case collectionViewTop:
            return presenter.listsVCObjectsCount()
        case collectionViewBottom:
            return presenter.searchListsObjectsCount()
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch collectionView {
        case collectionViewTop:

            guard let topCell = collectionViewTop.dequeueReusableCell(withReuseIdentifier: identifier,
                                                                      for: indexPath) as? CellForCollectionViews else {
                return UICollectionViewCell()
            }

            topCell.displayContent(state: presenter.listViewState(at: indexPath.item))
            return topCell

        case collectionViewBottom:

            guard let bottomCell = collectionViewBottom.dequeueReusableCell(withReuseIdentifier: identifier,
                                                                            for: indexPath) as? CellForCollectionSearchView else {
                return UICollectionViewCell()
            }

            bottomCell.displayContent(sarchControllerState: presenter.searchCellState(at: indexPath.item))
            return bottomCell
        default:
            return UICollectionViewCell()
        }
    }
}

private extension ListsDataSource {
    private func register(_ collectionViewTop: UICollectionView, collectionViewBottom: UICollectionView) {
        collectionViewTop.register(UINib(nibName: String(describing: CellForCollectionViews.self),
                                         bundle: nil), forCellWithReuseIdentifier: identifier)
        collectionViewBottom.register(UINib(nibName: String(describing: CellForCollectionSearchView.self),
                                            bundle: nil), forCellWithReuseIdentifier: identifier)
    }
}
