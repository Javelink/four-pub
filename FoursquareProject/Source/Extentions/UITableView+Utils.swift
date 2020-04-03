//
//  UITableView+Utils.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/13/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {

    func setupUITableView() {
        keyboardDismissMode = .onDrag
        rowHeight = 88.0
        separatorColor = .clear
        register(UINib(nibName: String(describing: CellForTableViews.self), bundle: nil), forCellReuseIdentifier: identifierTableCell())
    }

    func identifierTableCell() -> String {
        return "cell"
    }
}
