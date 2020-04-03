//
//  UIViewController+Utils.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/17/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    class func loadFromStoryboard(_ name: Storyboards) -> Self {
        return instantiateFromStoryboardHelper(name)
    }

    private class func instantiateFromStoryboardHelper<T>(_ name: Storyboards) -> T {
        let storyboard = UIStoryboard(name: name.rawValue, bundle: nil)

        guard let controller = storyboard.instantiateViewController(withIdentifier: String(describing: self)) as? T else {
            fatalError("fatalError")
        }

        return controller
    }

    func hideKeyboardForTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func endEditing() {
        view.endEditing(true)
    }

    func showAlertController(title:String, message: String) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        return alertController
    }
    
    func activityIndicator() -> UIActivityIndicatorView {

        let activityIndicator = UIActivityIndicatorView()

        if #available(iOS 13.0, *) {
            activityIndicator.style = .large
        } else {
            // Fallback on earlier versions
        }

        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .blue
        activityIndicator.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        activityIndicator.backgroundColor = .clear
        view.addSubview(activityIndicator)

        return activityIndicator
    }

    

    func startActivityIndicator() {
        activityIndicator().startAnimating()
    }

    func stopAnimatingActivityIndicator() {
        activityIndicator().stopAnimating()
        activityIndicator().removeFromSuperview()
    }

    func push(_ view: UIViewController) {
        navigationController?.pushViewController(view, animated: true)
    }
}
