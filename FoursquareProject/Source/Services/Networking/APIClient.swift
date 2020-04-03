//
//  Networking.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 3/21/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation

struct APIClient {
    
    static func fetchResponce<T: Codable>(_ endpoint: EndpointType,
                                          component: RequestStrings,
                                          withCompletion completion: @escaping (_ model: T) -> Void) {
        
        let urlString = "\(endpoint.baseURL.appendingPathComponent(endpoint.path))" +
                        "\(sendComponent(component).appending(endpoint.staticParameters))"

        print(urlString)

        guard let url = URL(string: urlString) else {
            return
        }

        URLSession.shared.dataTask(with: url) { (data, _, error) in

            guard let dataResponse = data, error == nil else {
                print(error?.localizedDescription ?? "Response Error")
                return
            }

            do {
                let responseObject = try JSONDecoder().decode(T.self, from: dataResponse)
                completion(responseObject)
            } catch let parsingError {
                print("Error", parsingError)
            }
        }.resume()
    }
}

private func sendComponent(_ component: RequestStrings) -> String {
    var components = URLComponents()
    components.query = component.string
    
    guard let stringComponent = components.string else {
        return ""
    }
    
    return stringComponent
}
