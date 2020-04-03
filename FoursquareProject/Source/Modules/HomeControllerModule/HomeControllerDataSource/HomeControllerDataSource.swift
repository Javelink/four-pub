//
//  HomeControllerDataSource.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/28/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation
import UIKit

protocol HomeControllerDataSourceProtocol {
    func searchCellState(at index: Int) -> SearchControllerState
    func searchControllerObjectsCount() -> Int
}

class HomeControllerDataSource: NSObject {

    private var collectionView: UICollectionView!
    private let identifier = "identifier"
    var presenter: HomeControllerDataSourceProtocol?

    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        presenter = HomePresenter()
        collectionView.register(UINib(nibName: String(describing: CellForCollectionSearchView.self),
                                      bundle: nil), forCellWithReuseIdentifier: identifier)
    }

    func title(_ index: Int) -> String {
        return presenter?.searchCellState(at: index).title ?? ""
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension HomeControllerDataSource: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.searchControllerObjectsCount() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
                                                            for: indexPath) as? CellForCollectionSearchView,
              let state = presenter?.searchCellState(at: indexPath.item) else {
            return UICollectionViewCell()
        }

        cell.displayContent(sarchControllerState: state)

        return cell
    }
}
