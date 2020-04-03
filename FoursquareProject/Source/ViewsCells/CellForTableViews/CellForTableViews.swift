//
//  CellForTableViews.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/13/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import UIKit

class CellForTableViews: UITableViewCell {

    @IBOutlet private weak var cellImageView: UIImageView!
    @IBOutlet private weak var cellTitleLabel: UILabel!
    @IBOutlet private weak var cellPrularNameLabel: UILabel!

    func displayContent(state: CellForTableViewsState) {
        cellImageView.image = UIImage(data: state.data, scale: 1.0)
        cellTitleLabel.text = state.name
        cellPrularNameLabel.text = state.pluralName

        cellTitleLabel.numberOfLines()
        cellImageView.layer.cornerRadius = 20
    }
}
