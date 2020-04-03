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

        layer.cornerRadius = 20
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 20
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.darkGray.cgColor
    }
}
