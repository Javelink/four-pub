//
//  MapViewController.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 4/16/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//

import UIKit
import MapKit

final class MapViewController: UIViewController {
    
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var searchTextField: UITextField!
    var output: MapsViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        setupMapView()
        hideKeyboardForTap()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        output?.viewDidAppear()
    }
}

// MARK: - MapsViewInput
extension MapViewController: MapsViewInput {

    func localSearch(_ searchText: String) {
        locationManager.searchOnMap(mapView, searchText: searchText, activityIndicator: activityIndicator())
    }
}

// MARK: - MKMapViewDelegate
extension MapViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {

        guard let userLocation = userLocation.location?.coordinate else {
            return
        }

        let center = CLLocationCoordinate2D(latitude: userLocation.latitude, longitude: userLocation.longitude)
        locationManager.region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(locationManager.region, animated: true)
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        mapView.removeOverlays(mapView.overlays)

        guard let coordinate = view.annotation?.coordinate else {
            return
        }

        locationManager.drawRoute(mapView, coordinate: coordinate)
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0
        return renderer
    }
}

// MARK: - UITextFieldDelegate
extension MapViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.isUserInteractionEnabled = true
        textField.resignFirstResponder()
        localSearch(textField.text ?? "")
        return true
    }
}

// MARK: - Action
private extension MapViewController {

    @IBAction private func onMapViewChanged(_ sender: UISegmentedControl) {
        mapView?.mapType = MKMapType(rawValue: UInt(sender.selectedSegmentIndex)) ?? .standard
    }
}

// MARK: - Setup
private extension MapViewController {
    private func setupMapView() {
        mapView?.delegate = self
        mapView?.showsUserLocation = true
    }
}
