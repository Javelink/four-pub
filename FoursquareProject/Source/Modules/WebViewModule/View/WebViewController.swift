//
//  WebViewController.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 7/8/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet private var webView: WKWebView!
    var webPres: WebPresenter!

    override func loadView() {
        super.loadView()
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        webPres.delegate = self
        webPres.loadWebScreen()
    }
}

extension WebViewController: WebLoader {
    func load(_ string: String, text: String?) {

        guard let searchQuerry = text?.removeWhitespace(),
              let url = URL(string: string + String(describing: searchQuerry)) else {
            return
        }

        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
}
