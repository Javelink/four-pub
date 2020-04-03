//
//  CellForCollectionViews.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/13/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import UIKit

struct CellForCollectionViewsState {
    var title: String
    var image: UIImage
    var description: String
}

class CellForCollectionViews: UICollectionViewCell {
    @IBOutlet private weak var cellImageView: UIImageView!
    @IBOutlet private weak var cellTitleLabel: UILabel!
    @IBOutlet private weak var cellDescriptionLabel: UILabel!

    func displayContent(state: CellForCollectionViewsState) {
        cellTitleLabel.text = state.title
        cellImageView.image = state.image
        cellDescriptionLabel.text = state.description

        cellTitleLabel.numberOfLines()
        cellDescriptionLabel.numberOfLines()

        layer.borderWidth = 3
        layer.borderColor = UIColor.darkGray.cgColor
    }
}
