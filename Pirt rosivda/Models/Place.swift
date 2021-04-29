//
//  Place.swift
//  Pirt rosivda
//
//  Created by Rachid Ben said on 29/04/2021.
//

import Foundation

import Foundation

struct Places: Codable {
    let results: [Result]?
    let status: String?

    enum CodingKeys: String, CodingKey {
        case results, status
    }
}

// MARK: - Result
struct Result: Codable {
    let geometry: Geometry?
    let icon: String?
    let name: String?
    let openingHours: OpeningHours?
    let photos: [Photo]?
    let placeID, reference: String?
    let types: [String]?
    let vicinity: String?
    let formattedAddress: String?

    enum CodingKeys: String, CodingKey {
        case geometry, icon, name
        case openingHours = "opening_hours"
        case photos
        case placeID = "place_id"
        case formattedAddress = "formatted_address"
        case reference, types, vicinity
    }
}

// MARK: - Geometry
struct Geometry: Codable {
    let location: Location?
}

// MARK: - Location
struct Location: Codable {
    let lat, lng: Double?
}

// MARK: - OpeningHours
struct OpeningHours: Codable {
    let openNow: Bool?

    enum CodingKeys: String, CodingKey {
        case openNow = "open_now"
    }
}

// MARK: - Photo
struct Photo: Codable {
    let height: Int?
    let photoReference: String?
    let width: Int?

    enum CodingKeys: String, CodingKey {
        case height
        case photoReference = "photo_reference"
        case width
    }
}
