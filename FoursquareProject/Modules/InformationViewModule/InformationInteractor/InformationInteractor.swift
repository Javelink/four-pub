//
//  InformationInteractor.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 5/28/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

class InformationInteractor {
    var output: InformationInteractorOutput?
}

extension InformationInteractor: InformationInteractorInput {
    func openedSocialLink(_ url: String, text: String?) {

        guard let searchQuerry = text?.removeWhitespace(),
              let url = URL(string: url + String(describing: searchQuerry)) else {
            return
        }

        output?.interactorDidLink(url)
    }
    
    func openedLink(_ text: String?) {

        guard let string = text,
              let searchQuerry = string.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed),
              let url = URL(string: searchQuerry) else {
            return
        }

        output?.interactorDidLink(url)
    }

    func fetchedInfomationForVenues(identifier: String?) {

        DispatchQueue.global(qos: .background).async { [weak self] in

            guard let weakSelf = self else { return }

            weakSelf.fetchVenues(identifier: identifier)
        }
    }
}

// MARK: - Methods
private extension InformationInteractor {

    private func fetchVenues(identifier: String?) {
        var data: Data?

        guard let identifier = identifier else {
            return
        }

        APIClient.fetchResponce(VenuesEndpoint.identifier(identifier),
                                component: RequestStrings.informationString) { [weak self] (model: Employees) in

            guard let strongSelf = self,
                  let groups = model.response.venue?.photos?.groups else {
                return
            }

            for group in groups {

                guard let items = group.items else { return }

                for item in items {

                    guard let prefix = item.itemPrefix,
                          let suffix = item.suffix,
                          let urlImage = URL(string: prefix + "350x350" + suffix),
                          let imageData = try? Data(contentsOf: urlImage) else {
                        return
                    }

                    data = imageData
                }

            }

            guard let currentData = data else { return }

            let name = model.response.venue?.name ?? ""
            let phone = model.response.venue?.contact?.formattedPhone ?? ""
            let url = model.response.venue?.url ?? ""
            let address = model.response.venue?.location?.address ?? ""
            let twitter = model.response.venue?.contact?.twitter ?? ""
            let facebook = model.response.venue?.contact?.facebookName ?? ""
            let rating = model.response.venue?.rating ?? 0.0
            let ratingColor = model.response.venue?.ratingColor ?? ""

            strongSelf.setupDatailState(name: name,
                                        phone: phone,
                                        url: url,
                                        address: address,
                                        data: currentData,
                                        twitter: twitter,
                                        facebook: facebook,
                                        rating: rating,
                                        ratingColor: ratingColor)
        }
    }

    private func setupDatailState(name: String,
                                  phone: String,
                                  url: String,
                                  address: String,
                                  data: Data,
                                  twitter: String,
                                  facebook: String,
                                  rating: Double,
                                  ratingColor: String) {

        let detail = DetailState(name: name,
                                 phone: phone,
                                 url: url,
                                 address: address,
                                 data: data,
                                 twitter: twitter,
                                 facebook: facebook,
                                 rating: rating,
                                 ratingColor: ratingColor)

        DispatchQueue.main.sync {
            output?.interactorDidFetch(detail)
        }
    }
}
