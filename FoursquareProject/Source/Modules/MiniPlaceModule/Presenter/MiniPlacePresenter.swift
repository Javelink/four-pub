//
//  MiniPlacePresenter.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/4/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

final class MiniPlacePresenter {
    
    weak var delegate: ReloadDataDelegate?
    private var minivenues = [Minivenue]()
    
    func fetchMiniPlaces(dataString: String, query: String) {

        let currentCity = locationManager.cityName
        
        APIClient.fetchResponce(VenuesEndpoint.suggest,
                                component: RequestStrings.suggestString(currentCity,
                                                                        dataString: dataString,
                                                                        query: query)) { [weak self] (model: Employees) in
            
            guard let miniPlaces = model.response.minivenues, let strongSelf = self else {
                return
            }
            
            strongSelf.minivenues = miniPlaces
            strongSelf.delegate?.reloadData()
        }
    }

    func minivenueState(at index: Int) -> MinivenueState {
        
        let miniPlace = minivenues[index].name ?? ""
        let identifier = minivenues[index].id ?? ""
        let miniVenueState = MinivenueState(identifier: identifier, name: miniPlace)
        
        return miniVenueState
    }
    
    func minivenuesClean() {
        minivenues = []
    }
    
    func minivenuesCount() -> Int {
        return minivenues.count
    }
}
