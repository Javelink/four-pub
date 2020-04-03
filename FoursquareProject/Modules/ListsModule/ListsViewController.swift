//
//  ListsViewController.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/26/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import UIKit

final class ListsViewController: UIViewController {

    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var collectionViewTop: UICollectionView!
    @IBOutlet private weak var collectionViewBottom: UICollectionView!

    // MARK: - Property
    private var presenter = ListPresenter()
    private var dataSource: ListsDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupPageControl()
    }
}

// MARK: - UICollectionViewDelegate
extension ListsViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)

        switch collectionView {
        case collectionViewTop:
            navigationController?.pushViewController(ListViewEnum.listsVCObjects[indexPath.item].pushOnVC, animated: true)
        case collectionViewBottom:
            let title = presenter.searchCellState(at: indexPath.item).title
            navigationController?.pushViewController(SearchAssemdler.createSearchModule(query: title), animated: true)
        default:
            break
        }
    }
}

// MARK: - Actions
private extension ListsViewController {

    @IBAction private func searchAction(_ sender: UIBarButtonItem) {
        navigationController?.pushViewController(SearchAssemdler.createSearchModule(query: ""), animated: true)
    }

    @IBAction private func pageChanged(_ sender: UIPageControl) {
        pageControl.currentPage = presenter.listsVCObjectsCount()
    }
}

// MARK: - UIScrollView
extension ListsViewController {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}

// MARK: - Setup
private extension ListsViewController {

    private func setupCollectionView() {
        dataSource = ListsDataSource(collectionViewTop: collectionViewTop, collectionViewBottom: collectionViewBottom)
        collectionViewTop.delegate = self
        collectionViewBottom.delegate = self
        collectionViewTop.dataSource = dataSource
        collectionViewBottom.dataSource = dataSource
    }

    private func setupPageControl() {
        pageControl.numberOfPages = presenter.listsVCObjectsCount()
    }
}
