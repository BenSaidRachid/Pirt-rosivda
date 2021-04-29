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
    @IBOutlet weak var mapVIew: MKMapView!
    
    private let locationManager:CLLocationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(textFieldDidTap))
              textField.addGestureRecognizer(tapGesture)
    }

    override func viewDidAppear(_ animated: Bool) {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.startUpdatingLocation()
        mapVIew.showsUserLocation = true
    }
    
    @objc func textFieldDidTap() {
        self.performSegue(withIdentifier: "showSearch", sender: self)
    }
    
    @IBAction func recenterLocation(_ sender: Any)
    {
        if let location = mapVIew.userLocation.location {
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
        mapVIew.setRegion(region, animated: true)
    }
}

extension HomeViewController: SearchViewControllerDelegate {
    func search(text: String) {
        print(text)
    }
    
    
}
