//
//  API.swift
//  Pirt rosivda
//
//  Created by Rachid Ben said on 16/04/2021.
//

import Foundation
import MapKit

class API {
    static var shared = API()
    
    private let baseURL = "https://maps.googleapis.com/maps/api/place"
    private let session = URLSession(configuration: .default)
    
    func call(_ path: String, location: CLLocation, completion: @escaping (Places?) -> Void) {
        guard let API_KEY = Config.getGoogleApiKey() else {
            completion(nil)
            return
        }
        
        let latLng = "\(location.coordinate.latitude),\(location.coordinate.longitude)"
        
        guard let url = URL(string: "\(baseURL)/\(path)&location=\(latLng)&radius=3500&key=\(API_KEY)") else {
            completion(nil)
            return
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let places = try decoder.decode(Places.self, from: data)
                    DispatchQueue.main.async { completion(places) }
                } catch (let error) {
                    print(error)
                    DispatchQueue.main.async { completion(nil) }
                    print("Deserialisation failed")
                }
            } else {
                DispatchQueue.main.async { completion(nil) }
                print("No data")
            }
        }

        task.resume()
    }
    
    func searchBy(_ suggestion: Suggestion, location: CLLocation, completion: @escaping (Places?) -> Void) {
        let path = "nearbysearch/json?type=\(suggestion.type)"
        call(path, location: location, completion: completion)
    }
    
    func searchBy(_ term: String, location: CLLocation, completion: @escaping (Places?) -> Void) {
        let path = "textsearch/json?query=\(term)"
        call(path, location: location, completion: completion)
    }
}
