//
//  Suggestion.swift
//  Pirt rosivda
//
//  Created by Rachid Ben said on 23/04/2021.
//

import Foundation

enum Suggestion: CaseIterable {
    case cafe
    case restaurant
    case art
    case health
    case animal
    case house
    case airplane
    case balloon
    case book
    
    var iconName: String {
        switch self {
            case .cafe:
                return "coffee"
            case .restaurant:
                return "restaurant"
            case .art:
                return "palette"
            case .health:
                return "heart"
            case .animal:
                return "animal"
            case .house:
                return "house"
            case .airplane:
                return "airplane"
            case .balloon:
                return "balloon"
            case .book:
                return "book"
        }
    }
    
    var title: String {
        switch self {
            case .cafe:
                return "Cafés et thés"
            case .restaurant:
                return "Alimentation"
            case .art:
                return "Art & Loisirs"
            case .health:
                return "Santé & Médical"
            case .animal:
                return "Animaux de compagnie"
            case .house:
                return "Immobilier"
            case .airplane:
                return "Hôtels & Séjours"
            case .balloon:
                return "Organisation d'événements"
            case .book:
                return "Formation & Enseignement"
        }
    }
    
    var type: String {
        switch self {
            case .cafe:
                return "cafe"
            case .restaurant:
                return "restaurant"
            case .art:
                return "art_gallery"
            case .health:
                return "doctor"
            case .animal:
                return "pet_store"
            case .house:
                return "real_estate_agency"
            case .airplane:
                return "airport"
            case .balloon:
                return "tourist_attraction"
            case .book:
                return "book_store"
        }
    }
}
