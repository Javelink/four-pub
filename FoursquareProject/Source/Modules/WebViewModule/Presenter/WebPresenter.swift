//
//  WebPresenter.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 7/8/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

protocol WebLoader: class {
    func load(_ string: String, text: String?)
}

class WebPresenter {

    private var urlString: String
    private var text: String
    weak var delegate: WebLoader?

    init(_ urlString: String, text: String) {
        self.urlString = urlString
        self.text = text
    }

    func loadWebScreen() {
        delegate?.load(urlString, text: text)
    }
}
