//
//  CellForCollectionSearchView.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/14/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import UIKit

class CellForCollectionSearchView: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    func displayContent(sarchControllerState: SearchControllerState) {
        titleLabel.text = sarchControllerState.title
        imageView.image = sarchControllerState.image
    }
}
