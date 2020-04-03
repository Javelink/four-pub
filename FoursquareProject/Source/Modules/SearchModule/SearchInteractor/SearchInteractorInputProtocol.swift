//
//  SearchInteractorInputProtocol.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/16/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

protocol SearchInteractorInputProtocol {
    func defaultValueChooseTF()
    func reloadedData()
    func changedVelue(query: String?)
    func fetchedVenues(_ querys: String, radius: String)
    func didIsEditedTF(_ textFieldText: String?, string: String, isEdit: Bool) -> Bool
    func checkedTF(_ enterTFtext: String, chooseRadiusTFtext: String) -> Bool
}
