//
//  ViewController.swift
//  Pirt rosivda
//
//  Created by Rachid Ben said on 16/04/2021.
//

import UIKit
import MapKit

class HomeViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var textField: TextField!
    @IBOutlet weak var mapView: MKMapView!
    var places: [Result]?
    private let locationManager: CLLocationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(textFieldDidTap))
              textField.addGestureRecognizer(tapGesture)
    }

    override func viewDidAppear(_ animated: Bool) {
        locationManager.delegate = self
        mapView.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
    
    @objc func textFieldDidTap() {
        self.performSegue(withIdentifier: "showSearch", sender: self)
    }
    
    @IBAction func recenterLocation(_ sender: Any)
    {
        if let location = mapView.userLocation.location {
            render(location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            locationManager.stopUpdatingLocation()
            render(location)
        }
    }
    
    func render(_ location: CLLocation) {
        let coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SearchViewController {
            vc.delegate = self
        }
    }
    
    func addPlacesAnnotation(_ places: [Result]?) {
        if let places = places {
            for place in places {
               mapView.addAnnotation(createPlaceAnnotation(place))
            }
        }
    }
    
    func createPlaceAnnotation(_ place: Result) -> PointAnnotation {
        guard let lat = place.geometry?.location?.lat, let long =  place.geometry?.location?.lng else {
            return PointAnnotation();
        }
        let newAnnotation = PointAnnotation()
        newAnnotation.title = place.name
        newAnnotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        newAnnotation.id = place.placeID
        return newAnnotation
    }
}

extension HomeViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? PointAnnotation else { return }
        guard let place = places?.first(where: { (place) -> Bool in
            return place.placeID == annotation.id
        }) else { return }
        print(place)
    }
}


extension HomeViewController: SearchViewControllerDelegate {
    func suggestion(suggestion: Suggestion) {
        if let location = mapView.userLocation.location {
            API.shared.searchBy(suggestion, location: location) { (places) in
                self.places = places?.results
                self.addPlacesAnnotation(places?.results)
            }
        }
    }
    
    func search(text: String) {
        if let location = mapView.userLocation.location {
            API.shared.searchBy(text, location: location) { (places) in
                self.places = places?.results
                self.addPlacesAnnotation(places?.results)
            }
        }
    }
}
