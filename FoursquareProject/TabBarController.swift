//
//  TabBarController.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 10/10/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = navControllers()
        imagesTabBar(self)
    }
}

// MARK: - Items For TabBar
@available(iOS 13.0, *)
extension TabBarController {

    func viewControllers() -> [UIViewController] {
        let firstVC = HomeController.loadFromStoryboard(.home)
        let listsVC = ListsViewController.loadFromStoryboard(.lists)
        let mapVC = MapViewController.loadFromStoryboard(.map)
        let favourite = FavoriuteView.loadFromStoryboard(.favoriute)
        let appStore = GamesViewController.loadFromStoryboard(.appStore)
        let arrayOfVC: [UIViewController] = [firstVC, listsVC, mapVC, favourite, appStore]
        return arrayOfVC
    }

    func navControllers() -> [UINavigationController] {
        var arrayNavVC: [UINavigationController] = []

        for viewC in viewControllers() {
            let navigationBar = UINavigationController(rootViewController: viewC)
            arrayNavVC.append(navigationBar)
        }

        return arrayNavVC
    }

    func imagesTabBar(_ tabBar: UITabBarController) {
        let titleImages = ["search-70", "list", "map-flat", "star", "list"]

        guard let items = tabBar.tabBar.items else { return }

        for index in 0..<items.count {
            items[index].image = UIImage(named: titleImages[index])?.withRenderingMode(.alwaysOriginal)
        }
    }
}
