//
//  InformationViewController.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 3/22/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import UIKit

final class InformationViewController: UIViewController {

    @IBOutlet private weak var placeImageView: UIImageView!
    @IBOutlet private weak var urlLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var twitterLabel: UILabel!
    @IBOutlet private weak var facebookLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var facebookButton: UIButton!
    @IBOutlet private weak var addressButton: UIButton!
    @IBOutlet private weak var phoneButton: UIButton!
    @IBOutlet private weak var twitterButton: UIButton!
    @IBOutlet private weak var urlButton: UIButton!
    @IBOutlet private var labels: [UILabel]!
    @IBOutlet private var buttons: [UIButton]!

    var output: InformationViewOutput?
    var pres: WebPresenter?

    // MARK: - Life Cycle View Controller
    override func loadView() {
        super.loadView()
        output?.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIComponents()
        setupElementInHidden()
        coordinator = Coordinator(navigationController!)
    }
}

// MARK: - Setup
private extension InformationViewController {

    private func setupUIComponents() {

        for button in buttons {
            button.addShadowAndCorner()
        }

        for label in labels {
            label.numberOfLines()
        }
    }
}

// MARK: - Actions
private extension InformationViewController {
    
    @IBAction private func onCall() {
        alertPhone()
    }
    
    @IBAction private func onMapAction(_ sender: UIButton) {
        coordinator?.routeToMaps(addressLabel.text)
    }

    @IBAction private func onUrlAction(_ sender: UIButton) {
        output?.viewLink(urlLabel.text)
    }

    @IBAction private func onPhoneAction(_ sender: UIButton) {
        alertPhone()
    }

    @IBAction private func onFacebookAction(_ sender: UIButton) {
        let urlString = "https://www.facebook.com/"
        let webView = WebViewController.loadFromStoryboard("WebView")
        let pres = WebPresenter(urlString, text: facebookLabel.text ?? "")
        webView.webPres = pres
        navigationController?.pushViewController(webView, animated: true)
    }

    @IBAction private func onTwitterAction(_ sender: UIButton) {
        let urlString = "https://twitter.com/"
        let webView = WebViewController.loadFromStoryboard("WebView")
        let pres = WebPresenter(urlString, text: twitterLabel.text ?? "")
        webView.webPres = pres
        navigationController?.pushViewController(webView, animated: true)
    }
}

// MARK: - InformationViewInput
extension InformationViewController: InformationViewInput {
    func openURLlink(_ url: URL) {
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    func venueDataSetup(_ model: DetailState) {
        nameLabel.text = model.name
        phoneLabel.text = model.phone
        urlLabel.text = model.url
        addressLabel.text = model.address
        twitterLabel.text = model.twitter
        facebookLabel.text = model.facebook
        placeImageView.image = UIImage(data: model.data, scale: 1.0)
        ratingLabel.text = String(model.rating)

        setupElementInVisible(model)
    }
}

// MARK: - Alert
private extension InformationViewController {

    private func alertPhone() {

        guard let phone = phoneLabel.text else {
            return
        }

        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        let call = UIAlertAction(title: "\(phone)", style: .default) { [weak self] (_: UIAlertAction) -> Void in

            guard let strongSelf = self else {
                return
            }

            let noCall = UIAlertController(title: nil, message: "Call impossible", preferredStyle: .alert)
            let okey = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            noCall.addAction(okey)
            strongSelf.present(noCall, animated: true, completion: nil)
        }

        alert.addAction(call)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Setup
private extension InformationViewController {

    private func setupElementInHidden() {
        facebookButton.isHidden = true
        facebookLabel.isHidden = true
        phoneButton.isHidden = true
        phoneLabel.isHidden = true
        addressButton.isHidden = true
        addressLabel.isHidden = true
        twitterButton.isHidden = true
        twitterLabel.isHidden = true
        urlButton.isHidden = true
        urlLabel.isHidden = true
    }

    private func setupElementInVisible(_ model: DetailState) {

        if model.rating == 0.0 {
            ratingLabel.isHidden = true
        } else {
            ratingLabel.backgroundColor = UIColor().colorWithHexString(hexString: model.ratingColor)
        }

        if model.facebook != "" {
            facebookButton.isHidden = false
            facebookLabel.isHidden = false
        }

        if model.phone != "" {
            phoneButton.isHidden = false
            phoneLabel.isHidden = false
        }

        if model.address != "" {
            addressButton.isHidden = false
            addressLabel.isHidden = false
        }

        if model.twitter != "" {
            twitterButton.isHidden = false
            twitterLabel.isHidden = false
        }

        if model.url != "" {
            urlButton.isHidden = false
            urlLabel.isHidden = false
        }
    }
}
