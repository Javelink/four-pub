//
//  TodayViewController.swift
//  FoursquareExt
//
//  Created by Andrey Slota on 7/9/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController {
        
    @IBOutlet private weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
    }

    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        completionHandler(NCUpdateResult.newData)
    }
}

// MARK: - NCWidgetProviding
extension TodayViewController: NCWidgetProviding {
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .compact {
            self.preferredContentSize = maxSize
        } else if activeDisplayMode == .expanded {
            self.preferredContentSize = CGSize(width: maxSize.width, height: 250)
        }
    }
}
