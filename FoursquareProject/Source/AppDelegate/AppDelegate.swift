//
//  AppDelegate.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 3/19/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        createTabBar()
        colorNavigationBar()
        locationManager.setupLocationManager()

        return true
    }
}

// MARK: - Items For TabBar
private extension AppDelegate {

    private func viewControllers() -> [UIViewController] {
        let firstVC = HomeController.loadFromStoryboard("HomeController")
        let listsVC = ListsViewController.loadFromStoryboard("ListsVC")
        let mapVC = MapViewController.loadFromStoryboard("MapVC")
        let arrayOfVC: [UIViewController] = [firstVC, listsVC, mapVC]
        return arrayOfVC
    }
    
    private func navControllers() -> [UINavigationController] {
        var arrayNavVC: [UINavigationController] = []
        
        for viewC in viewControllers() {
            let navigationBar = UINavigationController(rootViewController: viewC)
            arrayNavVC.append(navigationBar)
        }
        
        return arrayNavVC
    }

    private func imagesTabBar(_ tabBar: UITabBarController) {

        tabBar.tabBar.items?[0].image = UIImage(named: "search-70")?.withRenderingMode(.alwaysOriginal)
        tabBar.tabBar.items?[1].image = UIImage(named: "list")?.withRenderingMode(.alwaysOriginal)
        tabBar.tabBar.items?[2].image = UIImage(named: "map-flat")?.withRenderingMode(.alwaysOriginal)
    }

    private func createTabBar() {
        let tabBar = UITabBarController()
        tabBar.viewControllers = navControllers()
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
        imagesTabBar(tabBar)
    }
}

// MARK: - Color For NavBar
private extension AppDelegate {
    private func colorNavigationBar() {
        UINavigationBar.appearance().barTintColor = UIColor.blue
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
