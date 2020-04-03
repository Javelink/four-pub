//
//  Coordinator.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 7/12/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation
import UIKit

var coordinator: CoordinatorProtocol?

class Coordinator {

    var navigationController: UINavigationController

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: - CoordinatorProtocol
extension Coordinator: CoordinatorProtocol {

    func routeToMaps(_ address: String?) {
        push(MapsAssembly.createMapsModule(address))
    }

    func routeToInformation(_ stringId: String) {
        push(InformationAssembly.createInformationModule(stringId))
    }

    func routeToSearch(_ theme: String) {
        push(SearchAssemdler.createSearchModule(query: theme))
    }

    func routeToList(_ index: Int) {
        push(ListViewEnum.listsVCObjects[index].pushOnVC)
    }
}

// MARK: - Navigation Methods
private extension Coordinator {
    private func push(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }

    private func present(_ viewController: UIViewController) {
        navigationController.present(viewController, animated: true)
    }
}
