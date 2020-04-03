//
//  InformationInteractorInput.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/28/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

protocol InformationInteractorInput {
    func fetchedInfomationForVenues(identifier: String?)
    func openedLink(_ text: String?)
    func openedSocialLink(_ url: String, text: String?)
}
