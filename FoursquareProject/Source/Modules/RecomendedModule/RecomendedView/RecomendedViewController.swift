//
//  SecondViewController.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 3/25/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import UIKit

final class RecomendedViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    var output: RecomendedViewOutput?
    var dataSource: RecomendedDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        dataSource.delegate = self
        coordinator = Coordinator(navigationController!)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        output?.viewDidAppear()
    }
}

extension RecomendedViewController: RecomendedViewInput {
    func reloadData() {

        DispatchQueue.main.async { [weak self] in

            guard let strongSelf = self else {
                return
            }

            strongSelf.tableView.reloadData()
        }
    }
}

// MARK: - Setup
private extension RecomendedViewController {

    private func setupTableView() {
        dataSource = RecomendedDataSource(tableView: tableView)
        dataSource.dataSourceOutput = output as? RecomendedDatasourceProtocol
        tableView.setupUITableView()
    }
}

extension RecomendedViewController: Tapping {
    func didTap(stringId: String) {
        coordinator?.routeToInformation(stringId)
    }
}
