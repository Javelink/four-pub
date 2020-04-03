//
//  SearchDataSource.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/16/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation
import UIKit

protocol SearchDatasourceProtocol: class {
    func cellForTableViewsStatesCount() -> Int
    func cellForTableViewsState(at index: Int) -> CellForTableViewsState
    func isEmptyTF() -> Bool
}

protocol Tapping: class {
    func didTap(stringId: String)
}

class SearchDataSource: NSObject {
    private var tableView: UITableView!
    var dataSourceOutput: SearchDatasourceProtocol!
    var router: SearchRouterInputProtocol?
    weak var delegate: Tapping?

    init(tableView: UITableView) {
        self.tableView = tableView
        super.init()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension SearchDataSource: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceOutput.isEmptyTF() ? dataSourceOutput.cellForTableViewsStatesCount() : 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableView.identifierTableCell(), for: indexPath) as? CellForTableViews else {
            return UITableViewCell()
        }

        cell.displayContent(state: dataSourceOutput.cellForTableViewsState(at: indexPath.row))
        tableView.separatorColor = .lightGray

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let stringId = dataSourceOutput?.cellForTableViewsState(at: indexPath.row).identifier ?? ""
        delegate?.didTap(stringId: stringId)
    }
}
