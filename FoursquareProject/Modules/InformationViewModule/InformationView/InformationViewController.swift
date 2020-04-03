//
//  InformationViewController.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 3/22/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import UIKit
import CallKit
import SafariServices
import CloudKit

final class InformationViewController: UIViewController, CXProviderDelegate, SFSafariViewControllerDelegate {

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
    
    // MARK: - Life Cycle View Controller
    override func loadView() {
        super.loadView()
        output?.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIComponents()
        setupElementInHidden()
    }

    func providerDidReset(_ provider: CXProvider) {
    }

    func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
        action.fulfill()
    }

    func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
        action.fulfill()
    }

    func call() {
        guard let phone = phoneLabel.text else { return }

        let controller = CXCallController()
        let transaction = CXTransaction(action: CXStartCallAction(call: UUID(),
                                                                  handle: CXHandle(type: .generic, value: phone)))

        let config = CXProviderConfiguration(localizedName: "FoursquareProject")
        config.includesCallsInRecents = false
        config.supportsVideo = true

        let provider = CXProvider(configuration: config)
        provider.setDelegate(self, queue: nil)

        controller.request(transaction, completion: { _ in })
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: phone)
        update.hasVideo = true
        provider.reportNewIncomingCall(with: UUID(), update: update, completion: { _ in })

        DispatchQueue.main.asyncAfter(wallDeadline: DispatchWallTime.now() + 5) {
            provider.reportOutgoingCall(with: controller.callObserver.calls[0].uuid, connectedAt: nil)
        }
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

    @IBAction private func onFavorite() {
        guard let title = nameLabel.text, let image = placeImageView.image, let address = addressLabel.text else { return }

        var url: URL?

        var asset: CKAsset? {
            get {
                let data = image.pngData()
                url = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(NSUUID().uuidString + ".dat")
                if let url = url {
                    do {
                        try data!.write(to: url)
                    } catch let e as NSError {
                        print("Error! \(e)")
                    }
                    return CKAsset(fileURL: url)
                }
                return nil
            }
        }
        
        record.setValue(title, forKey: "name")
        record.setValue(address, forKey: "address")

        record["image"] = asset

        privateDatabase.save(record) { [weak self] (savedRecord, error) in

            guard let weakSelf = self else { return }

            guard error == nil else {
                print("Record Not Saved", String(describing: error?.localizedDescription))

                DispatchQueue.main.async {
                    weakSelf.present(weakSelf.showAlertController(title: "Error", message: "You need signIn in AppleID"),
                                     animated: true,
                                     completion: nil)
                }

                return
            }

            print("Record Saved")
        }
    }
    
    @IBAction private func onMapAction(_ sender: UIButton) {
        navigationController?.pushViewController(MapsAssembly.createMapsModule(location: addressLabel.text), animated: true)
    }

    @IBAction private func onUrlAction(_ sender: UIButton) {
        output?.viewLink(urlLabel.text)
    }

    @IBAction private func onPhoneAction(_ sender: UIButton) {
        alertPhone()
    }

    @IBAction private func onFacebookAction(_ sender: UIButton) {
        output?.viewSocialNetwork("https://www.facebook.com/", text: facebookLabel.text)
    }

    @IBAction private func onTwitterAction(_ sender: UIButton) {
        output?.viewSocialNetwork("https://twitter.com/", text: twitterLabel.text)
    }
}

// MARK: - InformationViewInput
extension InformationViewController: InformationViewInput {
    func openURLlink(_ url: URL) {
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true, completion: nil)
        safariVC.delegate = self
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

        let called = UIAlertAction(title: "\(phone)", style: .default) { [weak self] (_: UIAlertAction) -> Void in

            guard let strongSelf = self else { return }

            strongSelf.call()
        }

        alert.addAction(called)
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
            ratingLabel.backgroundColor = UIColor().colorWithHexString(model.ratingColor)
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
