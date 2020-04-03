//
//  MapsInteractor.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/28/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

class MapsInteractor {
    var output: MapsInteractorOutput?
}

extension MapsInteractor: MapsInteractorInput {

    func findedLocation(_ location: String?) {

        DispatchQueue.main.async { [weak self] in

            guard let strongSelf = self,
                  let locationString = location else {
                return
            }

            strongSelf.output?.interactorDidLocation(locationString)
        }
    }
}
