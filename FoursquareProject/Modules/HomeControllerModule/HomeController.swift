//
//  HomeController.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 3/25/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import UIKit

final class HomeController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var searchButton: UIButton!
    
    private var dataSource: HomeControllerDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        searchButton.addShadowAndCorner()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
    }

    func setupCollectionView() {
        dataSource = HomeControllerDataSource(collectionView: collectionView)
        collectionView.delegate = self
        collectionView.dataSource = dataSource
    }
}

// MARK: - UICollectionViewDelegate
extension HomeController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let title = dataSource?.title(indexPath.item) ?? ""
        navigationController?.pushViewController(SearchAssemdler.createSearchModule(query: title), animated: true)
    }
}

// MARK: - Action
private extension HomeController {

    @IBAction private func searchAction(_ sender: UIButton) {
        navigationController?.pushViewController(SearchAssemdler.createSearchModule(query: ""), animated: true)
    }
}
