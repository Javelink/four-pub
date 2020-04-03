//
//  SearchViewOutputProtocol.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/16/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

protocol SearchViewOutputProtocol: class {
    func viewDidLoad()
    func viewWillAppear()
    func searchCellStatesClean()
    func viewOnTextfieldValueChange(_ queryString: String?, radius: String?)
    func viewIsEditTF(_ textFieldText: String?, string: String, isEdit: Bool) -> Bool
    func viewIsEmptyTextFields(_ enterTFtext: String?, chooseRadiusTFtext: String?) -> Bool
}
