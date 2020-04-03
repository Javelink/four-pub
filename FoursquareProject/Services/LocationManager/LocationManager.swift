//
//  LocationManager.swift
//  FoursquareProject
//
//  Created by Andrey Slota on 3/25/19.
//  Copyright © 2019 Andrey Slota. All rights reserved.
//
import Foundation
import CoreLocation
import MapKit

let locationManager = LocationManager()

final class LocationManager: NSObject {

    var cityName: String = ""
    var region = MKCoordinateRegion()
    private let directionRequest = MKDirections.Request()
    private let locationManager = CLLocationManager()

    private func fetchCityName(from location: CLLocation, completion: @escaping (_ city: String?, _ error: Error?) -> Void) {
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            completion(placemarks?.first?.locality, error)
        }
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last

        guard let latitude = userLocation?.coordinate.latitude,
              let longitude = userLocation?.coordinate.longitude else {
            return
        }
        
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        fetchCityName(from: location, completion: { [weak self] (city, error) in
            
            guard let city = city, error == nil, let strongSelf = self else { return }
            
            strongSelf.cityName = city
        })
    }
}

extension LocationManager {
    
    func searchOnMap(_ mapView: MKMapView?, searchText: String, activityIndicator: UIActivityIndicatorView) {

        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchText

        MKLocalSearch(request: searchRequest).start { [weak self] (response, _) in

            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()

            guard let strongSelf = self,
                  let map = mapView,
                  let latitude = response?.boundingRegion.center.latitude,
                  let longitude = response?.boundingRegion.center.longitude,
                  let resp = response else {
                return
            }

            map.removeAnnotations(map.annotations)

            for item in resp.mapItems {
                let annotation = MKPointAnnotation()
                annotation.coordinate = item.placemark.coordinate
                annotation.title = item.name
                map.addAnnotation(annotation)
            }

            let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            strongSelf.region = MKCoordinateRegion(center: coordinate, span: span)
            map.setRegion(strongSelf.region, animated: true)
        }
    }

    func drawRoute(_ mapView: MKMapView?, coordinate: CLLocationCoordinate2D) {

        guard let lat = mapView?.userLocation.coordinate.latitude,
              let lon = mapView?.userLocation.coordinate.longitude else {
            return
        }

        let sourceLocation = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        let destinationLocation = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)

        directionRequest.source = MKMapItem(placemark: MKPlacemark(coordinate: sourceLocation))
        directionRequest.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationLocation))
        directionRequest.transportType = .walking

        let directions = MKDirections(request: directionRequest)

        directions.calculate { (response, error) in

            guard let directionResonse = response else { return }

            if error != nil {
                print(String(describing: error?.localizedDescription))
            }

            let route = directionResonse.routes[0]
            let rect = route.polyline.boundingMapRect

            mapView?.addOverlay(route.polyline, level: .aboveRoads)
            mapView?.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }
}

// MARK: - Setup
extension LocationManager {

    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.allowsBackgroundLocationUpdates = true
    }
}
