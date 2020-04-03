//
//  RecomendedDataSource.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/21/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation
import UIKit

protocol RecomendedDatasourceProtocol: class {
    func cellForTableViewsStatesCount() -> Int
    func cellForTableViewsState(at index: Int) -> CellForTableViewsState
}

class RecomendedDataSource: NSObject {
    var dataSourceOutput: RecomendedDatasourceProtocol?
    var tableView: UITableView!
    weak var delegate: Tapping?

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension RecomendedDataSource: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceOutput?.cellForTableViewsStatesCount() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableView.identifierTableCell(),
                                                       for: indexPath) as? CellForTableViews,
              let state = dataSourceOutput?.cellForTableViewsState(at: indexPath.item) else {
            return UITableViewCell()
        }

        cell.displayContent(state: state)
        tableView.separatorColor = .lightGray

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let stringId = dataSourceOutput?.cellForTableViewsState(at: indexPath.row).identifier ?? ""
        delegate?.didTap(stringId: stringId)
    }
}
