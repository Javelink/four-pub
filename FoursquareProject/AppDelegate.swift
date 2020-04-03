//
//  AppDelegate.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 3/19/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import UIKit
import BackgroundTasks
import CloudKit

@available(iOS 13.0, *)
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let fetchID = "com.nix.QuizApp.fetch"
    let resreshID = "com.nix.QuizApp.refresh"
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
        colorNavigationBar()
        locationManager.setupLocationManager()

        if #available(iOS 13.0, *) {
            registerBackgroundTasks()
        }

        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        if #available(iOS 13.0, *) {
            cancelAllPandingBGTask()
            scheduleFetcher()
            scheduleAppRefresh()
        }
    }
}

//MARK:- BGTask Helper
@available(iOS 13.0, *)
extension AppDelegate {

    //MARK: Registering backgroundtasks
    private func registerBackgroundTasks() {
        let dispatch = DispatchQueue.global()

        BGTaskScheduler.shared.register(forTaskWithIdentifier: fetchID, using: dispatch) { task in
            self.handlerFetcherTask(task as! BGProcessingTask)
        }

        BGTaskScheduler.shared.register(forTaskWithIdentifier: resreshID, using: dispatch) { task in
            self.handleAppRefreshTask(task as! BGAppRefreshTask)
        }
    }

    func cancelAllPendingBGTask() {
        BGTaskScheduler.shared.cancelAllTaskRequests()
    }

    func cancelAllPandingBGTask() {
        BGTaskScheduler.shared.cancelAllTaskRequests()
    }

    func scheduleFetcher() {
        let request = BGProcessingTaskRequest(identifier: fetchID)
        request.requiresNetworkConnectivity = true
        request.requiresExternalPower = false

//        request.earliestBeginDate = Date(timeIntervalSinceNow: 1)
        do {
            try BGTaskScheduler.shared.submit(request)
            print(dateFormatter.string(from: Date()), "bgFetch: \(locationManager.cityName)")
        } catch {
            print("Could not schedule featch: \(error)")
        }
    }

    func scheduleAppRefresh() {
        let request = BGAppRefreshTaskRequest(identifier: resreshID)

        do {
            try BGTaskScheduler.shared.submit(request)
            print(dateFormatter.string(from: Date()),"bgAppRefresh: \(locationManager.cityName)")
        } catch {
            print("Could not schedule app refresh: \(error)")
        }
    }

    func handleAppRefreshTask(_ task: BGAppRefreshTask) {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1

        task.expirationHandler = {
            queue.cancelAllOperations()
        }

        task.setTaskCompleted(success: true)
        scheduleAppRefresh()
    }

    func handlerFetcherTask(_ task: BGProcessingTask) {
        scheduleFetcher()
        task.setTaskCompleted(success: true)
    }
}

// MARK: - Color For NavBar
@available(iOS 13.0, *)
extension AppDelegate {
    func colorNavigationBar() {
        UINavigationBar.appearance().barTintColor = .blue
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}
